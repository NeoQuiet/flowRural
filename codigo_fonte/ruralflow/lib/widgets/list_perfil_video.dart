import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/item.dart';
import 'package:ruralflow/provider/item.dart';

class ListaPerfil extends StatelessWidget {
  Item itens;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _perfil(),
          Divider(),
          Text(
            ' Comércio',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Text(
            ' Bovinos e Derivados',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Text(
            'ANUNCIADOS',
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            leading: Container(
              child: Image.asset(
                'assets/images/queijocaipira.jpg',
                fit: BoxFit.cover,
              ),
            ),
            tileColor: Colors.green,
            title: Text('Queijo Caipira'),
            subtitle: Text(
              'Valor: R\$3,50\nQtde: Sob encomenda\nDisponível',
              maxLines: 3,
            ),
            isThreeLine: true,
            onTap: () {},
            trailing: Container(
              width: 100,
              height: 300,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.phone,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Notificar compra'),
                          content: Text('Tem certeza?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Não'),
                              onPressed: () => Navigator.of(context).pop(false),
                            ),
                            FlatButton(
                              child: Text('Sim'),
                              onPressed: () => Navigator.of(context).pop(true),
                            ),
                          ],
                        ),
                      ).then(
                        (value) async {
                          if (value) {
                            try {
                              await Provider.of<ItemProvider>(context,
                                      listen: false)
                                  .delete(itens.id);
                            } on HttpException catch (error) {}
                          }
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Notificar compra'),
                          content: Text('Tem certeza?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Não'),
                              onPressed: () => Navigator.of(context).pop(false),
                            ),
                            FlatButton(
                              child: Text('Sim'),
                              onPressed: () => Navigator.of(context).pop(true),
                            ),
                          ],
                        ),
                      ).then(
                        (value) async {
                          if (value) {
                            try {
                              await Provider.of<ItemProvider>(context,
                                      listen: false)
                                  .delete(itens.id);
                            } on HttpException catch (error) {}
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

_perfil() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: <Widget>[
        Divider(
          color: Colors.black,
        ),
        Container(
          color: Colors.white,
          height: 300,
          width: double.infinity,
          child: CircleAvatar(
            radius: 350,
            backgroundColor: Colors.white,
            child: Image.asset(
              'assets/images/pessoaicone.jpg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Divider(
          color: Colors.black,
        ),
        Text(
          ' Caio Rodrigo Cardoso Peixoto',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Divider(
          color: Colors.black,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' Estrelas ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.star,
                color: Colors.orange,
              ),
              label: Text('30'),
            )
          ],
        ),
        Divider(
          color: Colors.black,
        ),
        Row(
          children: [
            Text(
              ' Endereço:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              ' Fazenda do Gado ,',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            Text(
              ' S/N',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Text(
              ' Local:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              ' Ibaiti ,',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            Text(
              ' Paraná',
              style: TextStyle(
                color: Colors.grey,
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
              ' Telefone:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              ' 43 96502289',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            Text(
              ' - 43 96502289',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ],
    ),
  );
}
