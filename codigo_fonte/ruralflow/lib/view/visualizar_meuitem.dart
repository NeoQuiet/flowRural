import 'package:flutter/material.dart';

import 'package:ruralflow/models/item.dart';
import 'package:ruralflow/widgets/mostrar_meuitem.dart';

import 'package:ruralflow/widgets/visualizar_item.dart';

class DetalheMeuItem extends StatefulWidget {
  @override
  _DetalheMeuItemState createState() => _DetalheMeuItemState();
}

class _DetalheMeuItemState extends State<DetalheMeuItem> {
  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context).settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text('teste'),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            child: VisualizaMeuItem(item),
          ),
          Divider(
            color: Colors.red,
          ),
        ],
      )),
    );
  }
}
