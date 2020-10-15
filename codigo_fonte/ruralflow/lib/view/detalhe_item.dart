import 'package:flutter/material.dart';

import 'package:ruralflow/models/item.dart';

import 'package:ruralflow/widgets/visualizar_item.dart';

class DetalheItem extends StatefulWidget {
  @override
  _DetalheItemState createState() => _DetalheItemState();
}

class _DetalheItemState extends State<DetalheItem> {
  Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visualização'),
      ),
      body: VisualizaItem(item),
    );
  }
}
