import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/utils/app_routes.dart';

import '../models/pessoa.dart';

class ListCadLoja extends StatelessWidget {
  final Pessoa pessoa;

  ListCadLoja(this.pessoa);

  @override
  Widget build(BuildContext context) {
    // scaffold
    final scaffold = Scaffold.of(context);
    // lista em forma tijolo
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset('assets/images/lojaicone.png'),
      ),
      title: Text(pessoa.nome),
      onTap: () {
        Navigator.of(context).pushNamed(
          RotasFlowRural.VISUALIZAR_PESSOA,
        );
      },
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
                    arguments: pessoa);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.orange,
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
                            .delete(pessoa.id);
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
