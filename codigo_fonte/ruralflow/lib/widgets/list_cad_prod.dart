import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/anuncio.dart';
import 'package:ruralflow/models/produto.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/utils/app_routes.dart';

import '../models/pessoa.dart';

class ListCadProd extends StatelessWidget {
  final Produto produto;

  ListCadProd(this.produto);

  @override
  Widget build(BuildContext context) {
    // scaffold
    final scaffold = Scaffold.of(context);
    // lista em forma tijolo
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text('imagem'),
      ),
      title: Text('Queijo'),
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
                Navigator.of(context).pushNamed(RotasFlowRural.FORM_CAD_ANUNCIO,
                    arguments: produto);
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
                    title: Text('Falar por whatsApp'),
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
                        await Provider.of<Anuncios>(context, listen: false)
                            .delete(produto.id);
                      } on HttpException catch (error) {
                        scaffold.showSnackBar(
                          SnackBar(
                            content: Text(error.toString()),
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
    );
  }
}
