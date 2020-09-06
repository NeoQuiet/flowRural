import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/anuncio.dart';
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
// AO SELECIONAR O ANUNCIO O USUÁRIO É REDIRECIONADO PARA A PAGINA DE detalhes DO ANUNCIO
            Navigator.of(context).pushNamed(
              RotasFlowRural.ANUNCIO_DETALHE,
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
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.add_call),
            color: Theme.of(context).accentColor,
            onPressed: () {/* Adicionar o metodo de ligação com o whats app */},
          ),
        ),
      ),
    );
  }
}
