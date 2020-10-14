import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/item.dart';
import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/provider/item_provider.dart';
import 'package:ruralflow/utils/app_routes.dart';

class ListCadItem extends StatelessWidget {
  final Item itens;

  ListCadItem(
    this.itens,
  );

  @override
  Widget build(BuildContext context) {
    // scaffold
    final scaffold = Scaffold.of(context);
    // lista em forma tijolo
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(itens.valor),
            ),
            title: Text(itens.descricao),
            subtitle: Text(itens.ativo),
            trailing: Container(
              width: 100,
              height: 300,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.call,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          RotasFlowRural.FORM_CAD_ANUNCIO,
                          arguments: itens);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.input,
                      color: Colors.green,
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
                            } on HttpException catch (error) {
                              scaffold.showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Vendedor notificado, aguarde o contato.'),
                                ),
                              );
                            }
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
