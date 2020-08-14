import 'package:flutter/material.dart';
import 'package:ruralflow/models/anuncio.dart';

class AnuncioPlaca extends StatelessWidget {
  final Anuncio anuncio;

  const AnuncioPlaca({Key key, this.anuncio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        "https://onovelao.com.br/wp-content/uploads/2020/06/o-rei-do-gado-1200x675.jpg",
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: IconButton(
          icon: Icon(
            Icons.favorite,
          ),
          onPressed: () {},
        ),
        title: Text(
          "anuncio.descricao",
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_call),
          onPressed: () {},
        ),
      ),
    );
  }
}
