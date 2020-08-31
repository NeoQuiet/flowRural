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
      padding: EdgeInsets.all(16),
      key: _formularioCadastroPessoa,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nome completo',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'CPF/CNPJ',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'CEP',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Rua',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Cidade',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Estado',
            ),
          ),
        ],
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
