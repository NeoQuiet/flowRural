import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/item.dart';
import 'package:ruralflow/provider/item_provider.dart';

class VisualizaItem extends StatelessWidget {
  final Item item;
  VisualizaItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          width: 300,
          height: 100,
          child: Image.asset('assets/images/icone-produtos.png'),
        ),
        Divider(
          color: Colors.red,
        ),
        _txtDescricao(context),
      ],
    );
  }

  _txtDescricao(context) {
    final itensDados = Provider.of<ItemProvider>(context);
    final itens = itensDados.todositens;
    return Text(item.descricao);
  }
}
