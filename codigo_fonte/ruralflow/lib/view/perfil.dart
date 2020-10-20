import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ruralflow/models/Pessoa.dart';
import 'package:ruralflow/widgets/list_perfil.dart';

class PerfilPessoa extends StatefulWidget {
  @override
  _PerfilPessoaState createState() => _PerfilPessoaState();
}

class _PerfilPessoaState extends State<PerfilPessoa> {
  @override
  Widget build(BuildContext context) {
    final Pessoa pessoa = ModalRoute.of(context).settings.arguments as Pessoa;

    return Scaffold(
      appBar: AppBar(
        title: Text('Caio Rodrigo Cardoso Peixoto'),
        actions: [
          FlatButton(
            child: Text(
              'EDITAR',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: VisualizaPerfilPessoa(pessoa),
    );
  }
}
