import 'package:flutter/material.dart';

import 'package:ruralflow/models/item.dart';
import 'package:ruralflow/widgets/list_perfil_video.dart';
import 'package:ruralflow/widgets/list_usuario.dart';

import 'package:ruralflow/widgets/visualizar_item.dart';

class CartaoPessoa extends StatefulWidget {
  @override
  _CartaoPessoaState createState() => _CartaoPessoaState();
}

class _CartaoPessoaState extends State<CartaoPessoa> {
  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context).settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text('Caio Rodrigo'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.star_outline,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ListaPerfil(),
        ]),
      ),
    );
  }
}
