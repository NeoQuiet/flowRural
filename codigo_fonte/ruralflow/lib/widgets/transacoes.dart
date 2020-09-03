import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/comprar.dart';
import 'package:ruralflow/models/transacao.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Transacao trans = Provider.of(context);
    // final transAnuncios = trans.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(25),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 10),
                  Chip(
                    label: Text(
                      'R\$${trans.anuncio.valor}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: trans.anuncio.qtde,
              itemBuilder: (ctx, i) => TransAnun(cartItems[i]),
            ),
          ),
        ],
      ),
    );
  }
}
