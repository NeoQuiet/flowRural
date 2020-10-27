import 'package:flutter/material.dart';

import 'package:ruralflow/models/item.dart';

class VisualizaItem extends StatelessWidget {
  final Item item;

  VisualizaItem(
    this.item,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.deepOrange,
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'assets/images/queijocaipira.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Text(
            ' ${item.descricao}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Text(
            'Complemento: LOREM IPSUM,LOREM IPSUM, LOREM IPSUM, LOREM IPSUM,LOREM IPSUM',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Valor total:  R\$ ${item.valor}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Text(
                      'Quantidade: ${item.quantidade}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                _listTile(context),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  _listTile(context) {
    return FlatButton(
      onPressed: () {
        _return(context);
      },
      child: Text('${item.ativo}'),
    );
  }
}

_return(context) {
  return SnackBar(content: Text('Comprador '));
}
