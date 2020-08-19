import 'package:flutter/material.dart';
import 'package:ruralflow/models/anuncio.dart';
import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/view/anuncio_view.dart';

class AnuncioPlaca extends StatelessWidget {
  final Anuncio anuncio;

  const AnuncioPlaca({Key key, this.anuncio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRotas.ANUNCIO_DESCRICAO,
              arguments: anuncio,
            );
          },
          child: Image.network(
            "https://onovelao.com.br/wp-content/uploads/2020/06/o-rei-do-gado-1200x675.jpg",
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {},
          ),
          title: Text(
            "anuncio.descricao",
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.add_call),
            color: Theme.of(context).accentColor,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
