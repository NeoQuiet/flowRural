import 'package:flutter/material.dart';

class CadAnuncioForm extends StatefulWidget {
  @override
  _CadAnuncioFormState createState() => _CadAnuncioFormState();
}

class _CadAnuncioFormState extends State<CadAnuncioForm> {
  GlobalKey<FormState> _formularioCadastroAnuncio = GlobalKey();
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
        height: 500,
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Anuncio',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Descricao',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Quantidade',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Valor UN',
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
                    if (_formularioCadastroAnuncio.currentState.validate()) {
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
