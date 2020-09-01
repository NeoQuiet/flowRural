import 'package:flutter/material.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE WIDGET É O FORMULÁRIO DE CADASTRO DE SERVIÇO
 */
class CadServForm extends StatefulWidget {
  @override
  _CadServFormState createState() => _CadServFormState();
}

class _CadServFormState extends State<CadServForm> {
  GlobalKey<FormState> _formularioCadastroServ = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 400,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Serviço',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Descricao',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Valor total',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Expiracao',
              ),
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
                    if (_formularioCadastroServ.currentState.validate()) {
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
