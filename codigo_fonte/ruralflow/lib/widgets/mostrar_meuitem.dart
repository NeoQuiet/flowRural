import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/item.dart';
import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/provider/item.dart';

class VisualizaMeuItem extends StatelessWidget {
  final Item item;

  VisualizaMeuItem(
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
            'Complemento: Meu produto',
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
                Row(
                  children: [
                    Text(
                      'Ativo:  Sim',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _btn2(context),
                    Divider(
                      color: Colors.black,
                    ),
                    _btn1(context),
                  ],
                ),
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

  _btn2(context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        'Alterar',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    );
  }
}

_btn1(context) {
  return FlatButton(
    onPressed: () {},
    child: Text(
      'Inativar',
      style: TextStyle(color: Colors.white),
    ),
    color: Colors.red,
  );
}
