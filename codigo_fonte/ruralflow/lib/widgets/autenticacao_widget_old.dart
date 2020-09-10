import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/autenticacao_provider.dart';


enum LoginMode { Signup, Login }

/* 
  ESTE É O SERVIÇO DE AUTENTICAÇÃO, IRA PROVER A FUNCIONALIDADE 
  DE REALIZAR O LOGIN E REALIZAR O LOGOUT, BEM COMO O REGISTRO


 */

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  LoginMode _authMode = LoginMode.Login;

  final _passwordController = TextEditingController();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Future<void> _validar() async {
    _form.currentState.save();
    Auth auth = Provider.of(context, listen: false);
    await auth.signup(_authData["email"], _authData["password"]);
    
  
  }

  void _trocarModoLogin() {
    if (_authMode == LoginMode.Login) {
      setState(() {
        _authMode = LoginMode.Signup;
      });
    } else {
      setState(() {
        _authMode = LoginMode.Login;
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
        height: _authMode == LoginMode.Login ? 290 : 371,
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  
                  onSaved: (value) => _authData['email'] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  controller: _passwordController,
                  obscureText: true,
                 
                  onSaved: (value) => _authData['password'] = value,
                ),
                if (_authMode == LoginMode.Signup)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Confirmar Senha'),
                    obscureText: true,
                    
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
                      _authMode == LoginMode.Login ? 'ENTRAR' : 'REGISTRAR',
                    ),
                    onPressed: _validar,
                  ),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      " ",
                    ))
              ],
            )),
      ),
    );
  }
}
