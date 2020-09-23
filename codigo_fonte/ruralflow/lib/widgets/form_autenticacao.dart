import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/exceptions/autenticacao_exceptions.dart';
import 'package:ruralflow/provider/auth.dart';

enum AutenticacaoModo { Signup, Login }

/* 
  ESTE É O SERVIÇO DE AUTENTICAÇÃO, IRA PROVER A FUNCIONALIDADE 
  DE REALIZAR O LOGIN E REALIZAR O LOGOUT, BEM COMO O REGISTRO


 */

class AutenticacaoCartao extends StatefulWidget {
  @override
  _AutenticacaoCartaoState createState() => _AutenticacaoCartaoState();
}

class _AutenticacaoCartaoState extends State<AutenticacaoCartao> {
  GlobalKey<FormState> _formulario = GlobalKey();

  bool _isLoading = false;

  AutenticacaoModo _autenticacaoModo = AutenticacaoModo.Login;

  final _passwordController = TextEditingController();

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ocorreu um erro!'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Fechar'),
          )
        ],
      ),
    );
  }

  Future<void> _submeter() async {
    if (!_formulario.currentState.validate()) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    _formulario.currentState.save();

    Auth auth = Provider.of(context, listen: false);

    try {
      if (_autenticacaoModo == AutenticacaoModo.Login) {
        await auth.login(
          _authData["email"],
          _authData["password"],
        );
      } else {
        await auth.signup(
          _authData["email"],
          _authData["password"],
        );
      }
    } on AutenticacaoException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog("Ocorreu um erro inesperado!");
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _trocarModoLogin() {
    if (_autenticacaoModo == AutenticacaoModo.Login) {
      setState(() {
        _autenticacaoModo = AutenticacaoModo.Signup;
      });
    } else {
      setState(() {
        _autenticacaoModo = AutenticacaoModo.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: _autenticacaoModo == AutenticacaoModo.Login ? 290 : 371,
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formulario,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return "Informe um e-mail válido!";
                  }
                  return null;
                },
                onSaved: (value) => _authData['email'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty || value.length < 5) {
                    return "Informe uma senha válida!";
                  }
                  return null;
                },
                onSaved: (value) => _authData['password'] = value,
              ),
              if (_autenticacaoModo == AutenticacaoModo.Signup)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirmar Senha'),
                  obscureText: true,
                  validator: _autenticacaoModo == AutenticacaoModo.Signup
                      ? (value) {
                          if (value != _passwordController.text) {
                            return "Senha são diferentes!";
                          }
                          return null;
                        }
                      : null,
                ),
              Spacer(),
              if (_isLoading)
                CircularProgressIndicator()
              else
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryTextTheme.button.color,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    _autenticacaoModo == AutenticacaoModo.Login
                        ? 'ENTRAR'
                        : 'REGISTRAR',
                  ),
                  onPressed: _submeter,
                ),
              FlatButton(
                onPressed: _trocarModoLogin,
                child: Text(
                  " ${_autenticacaoModo == AutenticacaoModo.Login ? 'REGISTRAR' : 'ENTRAR'}",
                ),
                textColor: Colors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
