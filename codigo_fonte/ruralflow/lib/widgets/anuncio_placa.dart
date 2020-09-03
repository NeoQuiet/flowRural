import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/anuncio.dart';
import 'package:ruralflow/models/transacao.dart';

import '../utils/app_routes.dart';

class AnuncioGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Anuncio anuncio = Provider.of<Anuncio>(context, listen: false);
    final Transacao trans = Provider.of<Transacao>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRotas.ANUNCIO_DETALHE,
              arguments: anuncio,
            );
          },
          child: Image.network(
            "https://onovelao.com.br/wp-content/uploads/2020/06/o-rei-do-gado-1200x675.jpg",
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Anuncio>(
            builder: (ctx, anuncio, _) => IconButton(
              icon: Icon(
                  anuncio.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                anuncio.selecionaFavorito();
              },
            ),
          ),
          title: Text(
            anuncio.descricao,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {
              trans.addAnuncioTrans(anuncio);
            },
          ),
        ),
      ),
    );
  }
}
