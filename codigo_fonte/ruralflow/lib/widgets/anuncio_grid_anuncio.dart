import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/utils/app_routes.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE WIDGET CAPTURA AS INFORMAÇÕES DO ANUNCIO PARA A LISTAGEM DO MESMO NO GRID DE ANUNCIOS
*/

class GridAnuncio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pessoa pessoa = Provider.of<Pessoa>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
// AO SELECIONAR O ANUNCIO O USUÁRIO É REDIRECIONADO PARA A PAGINA DE detalhes DO ANUNCIO
            Navigator.of(context).pushNamed(
              RotasFlowRural.ANUNCIO_DETALHE,
              arguments: pessoa,
            );
          },
          child: Image.network(
            'https://www.jornaldocomercio.com/_midias/jpg/2017/03/17/708760_01_02-1495878.jpg',
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          leading: Consumer<Pessoa>(
            builder: (context, pessoa, _) => IconButton(
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {},
            ),
          ),
          title: Text(
            'pessoa.nome',
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).accentColor,
            onPressed: () {/* Adicionar o metodo de ligação com o whats app */},
          ),
        ),
      ),
    );
  }
}
