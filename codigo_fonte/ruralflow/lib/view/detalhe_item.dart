import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ruralflow/models/item.dart';
import 'package:ruralflow/provider/item_provider.dart';

import 'package:ruralflow/widgets/visualizar_item.dart';

class DetalheItem extends StatefulWidget {
  @override
  _DetalheItemState createState() => _DetalheItemState();
}

class _DetalheItemState extends State<DetalheItem> {
  Item item;

  @override
  Widget build(BuildContext context) {
    final itensDados = Provider.of<ItemProvider>(context);
    final itens = itensDados.todositens;

    return Scaffold(
      appBar: AppBar(
        title: Text('Visualização'),
      ),
      body: VisualizaItem(item),
    );
  }
}
