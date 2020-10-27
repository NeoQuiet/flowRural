import 'package:flutter/material.dart';

import 'package:ruralflow/models/item.dart';

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
            color: Colors.black,
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'assets/images/imagemnaodisponivel.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Text(
            ' ${item.item}',
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
                      '${item.descricao}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
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
                      '${item.ativo}',
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
      'Excluir',
      style: TextStyle(color: Colors.white),
    ),
    color: Colors.red,
  );
}
