import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/widgets/form_cad_anuncio_widget.dart';
import '../widgets/drawer.dart';
import '../widgets/list_cad_anuncio.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE ESTÁ INTERFACE TEM COMO FINALIDADE, LISTAR OS ANUNCIOS JÁ CRIADOS E 
PERMITIR QUE O USUÁRIO POSSA CRIAR, EDITAR OU INATIVAR ANUNCIOS. 
 */
class AnuncioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final anunciosDados = Provider.of<Anuncios>(context);
    final anuncios = anunciosDados.todosAnuncios;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadAnuncioForm(),
                    ),
                  );
                  // CadAnuncioForm();
                },
              )
            ],
            title: Text(
              'Gerenciar anuncios',
            ),
          ),
          drawer: AppDrawer(),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              //captura o total de anuncios
              itemCount: anunciosDados.totalAnuncios,
              //inicia a construção da lista de items
              itemBuilder: (ctx, i) =>
                  /* Este widget separa a listagem dos objetos inserindo uma linha entre eles */
                  Column(
                children: [
                  //Objeto que captura os anuncios cadastados e os lista
                  ListCadAnuncio(anuncios[i]),
                  //divisorresponsavel por desenha uma linha de divisao
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
