import 'package:flutter/material.dart';
import 'package:ruralflow/models/anuncio.dart';

class ListCadAnuncios extends StatelessWidget {
  final Anuncio anuncios;

  ListCadAnuncios(this.anuncios);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(anuncios.valor),
      ),
      title: Text(anuncios.anuncio),
      trailing: Container(
        width: 100,
        height: 300,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
