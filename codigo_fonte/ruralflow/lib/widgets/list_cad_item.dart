import 'dart:io';

import 'package:flutter/material.dart';

import 'package:ruralflow/models/item.dart';

import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/utils/constante.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ListCadItem extends StatelessWidget {
  final Item itens;
  String _link = '${Constants.ZAPZAP}';

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
            onTap: () {
              Navigator.of(context).pushNamed(
                RotasFlowRural.DETALHE_ITEM,
                arguments: itens,
              );
            },
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/images/imagemnaodisponivel.jpg',
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              '${itens.item}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            subtitle: Text(
              '${itens.descricao}\n${itens.ativo}\nR\$${itens.valor}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            isThreeLine: true,
            onTap: () {
              Navigator.of(context)
                  .pushNamed(RotasFlowRural.VISUALIZAR, arguments: itens);
            },
            trailing: Container(
              width: 100,
              height: 300,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
<<<<<<< HEAD
                    onPressed: () {
                      launchWhatsApp();
                    },
=======
                    onPressed: () {},
>>>>>>> 711993742512a8b42400c1f3ae6b8a8e37080ecb
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
<<<<<<< HEAD
                    onPressed: () {},
=======
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
                                      'Vendedor notificado, aguarde o contato. $error'),
                                ),
                              );
                            }
                          }
                        },
                      );
                    },
>>>>>>> 711993742512a8b42400c1f3ae6b8a8e37080ecb
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+0554384995003',
      text: "Do flow Rural direto pra ca teste",
    );
    // Convert the WhatsAppUnilink instance to a string.
    // Use either Dart's string interpolation or the toString() method.
    // The "launch" method is part of "url_launcher".
    await launch(link.toString());
  }
}
