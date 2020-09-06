import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/anuncio.dart';
<<<<<<< HEAD:codigo_fonte/ruralflow/lib/widgets/anuncio_grid_anuncio.dart
import 'package:ruralflow/utils/app_routes.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE WIDGET CAPTURA AS INFORMAÇÕES DO ANUNCIO PARA A LISTAGEM DO MESMO NO GRID DE ANUNCIOS
*/

class GridAnuncio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Anuncio anuncio = Provider.of<Anuncio>(context, listen: false);
=======
import 'package:ruralflow/models/transacao.dart';

import '../utils/app_routes.dart';

class AnuncioGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Anuncio anuncio = Provider.of<Anuncio>(context, listen: false);
    final Transacao trans = Provider.of<Transacao>(context, listen: false);

>>>>>>> f0c9d0af1838e6751c54f86d70b22c5303bc43d5:codigo_fonte/ruralflow/lib/widgets/anuncio_placa.dart
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
<<<<<<< HEAD:codigo_fonte/ruralflow/lib/widgets/anuncio_grid_anuncio.dart
// AO SELECIONAR O ANUNCIO O USUÁRIO É REDIRECIONADO PARA A PAGINA DE detalhes DO ANUNCIO
            Navigator.of(context).pushNamed(
              RotasFlowRural.ANUNCIO_DETALHE,
=======
            Navigator.of(context).pushNamed(
              AppRotas.ANUNCIO_DETALHE,
>>>>>>> f0c9d0af1838e6751c54f86d70b22c5303bc43d5:codigo_fonte/ruralflow/lib/widgets/anuncio_placa.dart
              arguments: anuncio,
            );
          },
          child: Image.network(
            "https://onovelao.com.br/wp-content/uploads/2020/06/o-rei-do-gado-1200x675.jpg",
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
<<<<<<< HEAD:codigo_fonte/ruralflow/lib/widgets/anuncio_grid_anuncio.dart
          backgroundColor: Colors.black45,
          leading: Consumer<Anuncio>(
            builder: (context, anuncio, _) => IconButton(
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {},
            ),
          ),
          title: Text(
            anuncio.anuncio,
=======
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
>>>>>>> f0c9d0af1838e6751c54f86d70b22c5303bc43d5:codigo_fonte/ruralflow/lib/widgets/anuncio_placa.dart
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
<<<<<<< HEAD:codigo_fonte/ruralflow/lib/widgets/anuncio_grid_anuncio.dart
            onPressed: () {/* Adicionar o metodo de ligação com o whats app */},
=======
            onPressed: () {
              trans.addAnuncioTrans(anuncio);
            },
>>>>>>> f0c9d0af1838e6751c54f86d70b22c5303bc43d5:codigo_fonte/ruralflow/lib/widgets/anuncio_placa.dart
          ),
        ),
      ),
    );
  }
}
