import 'package:flutter/material.dart';

import 'package:ruralflow/models/item.dart';

import 'package:ruralflow/widgets/visualizar_item.dart';

class DetalheItem extends StatefulWidget {
  @override
  _DetalheItemState createState() => _DetalheItemState();
}

class _DetalheItemState extends State<DetalheItem> {
  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context).settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.descricao),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            child: VisualizaItem(item),
          ),
          Divider(
            color: Colors.red,
          ),
        ],
      )),
    );
  }
}
