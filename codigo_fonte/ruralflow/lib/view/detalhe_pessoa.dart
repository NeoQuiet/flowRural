import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ruralflow/models/Pessoa.dart';

import 'package:ruralflow/widgets/visualiza_pessoa.dart';

class DetalhePessoa extends StatefulWidget {
  @override
  _DetalhePessoaState createState() => _DetalhePessoaState();
}

class _DetalhePessoaState extends State<DetalhePessoa> {
  @override
  Widget build(BuildContext context) {
    final Pessoa pessoa = ModalRoute.of(context).settings.arguments as Pessoa;

    return Scaffold(
      appBar: AppBar(
        title: Text('pessoa.nome'),
      ),
      body: VisualizaPessoa(pessoa),
    );
  }
}
