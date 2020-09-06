import 'package:flutter/material.dart';
import 'package:ruralflow/models/anuncio.dart';

class ListCadAnuncio extends StatelessWidget {
  final Anuncio anuncio;
  ListCadAnuncio(this.anuncio);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(anuncio.anuncio),
      trailing: Container(
        width: 100,
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
