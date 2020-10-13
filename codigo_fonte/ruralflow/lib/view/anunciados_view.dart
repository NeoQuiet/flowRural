import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/utils/app_routes.dart';
import '../widgets/drawer.dart';
import '../widgets/list_cad_anuncio.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE ESTÁ INTERFACE TEM COMO FINALIDADE, LISTAR OS ANUNCIOS JÁ CRIADOS E 
PERMITIR QUE O USUÁRIO POSSA CRIAR, EDITAR OU INATIVAR ANUNCIOS. 
 */
class AnunciadosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    RotasFlowRural.FORM_CAD_ANUNCIO,
                  );
                  // CadAnuncioForm();
                },
              ),
            ],
            title: Text(
              'Buscar Lojas',
            ),
          ),
          body: _body(context),
        ),
      ],
    );
  }
}

_body(context) {
  final anunciosDados = Provider.of<Anuncios>(context);
  final anuncios = anunciosDados.todosAnuncios;
  return Container(
    child: Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        //captura o total de anuncios
        itemCount: anunciosDados.totalAnuncios,
        //inicia a construção da lista de items
        itemBuilder: (ctx, i) => Column(
          children: [
            //Objeto que captura os anuncios cadastados e os lista
            ListCadAnuncio(anuncios[i]),

            //divisor responsavel por desenha uma linha de divisaos
            Divider(),
          ],
        ),
      ),
    ),
  );
}
