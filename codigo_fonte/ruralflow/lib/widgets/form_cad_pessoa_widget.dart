import 'package:flutter/material.dart';

class CadPessoaForm extends StatefulWidget {
  @override
  _CadPessoaFormState createState() => _CadPessoaFormState();
}

class _CadPessoaFormState extends State<CadPessoaForm> {
  GlobalKey<FormState> _formularioCadastroPessoa = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 30,
        top: 10,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Form(
        key: _formularioCadastroPessoa,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nome completo',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Inválido';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'CPF/CNPJ',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Inválido';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Telefone celular',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Inválido';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'CEP',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Rua',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Cidade',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Estado',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                child: RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formularioCadastroPessoa.currentState.validate()) {
                      // Process data.
                    }
                  },
                  child: Text(
                    'Cadastrar',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* 

ard(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child:

 */
