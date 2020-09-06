import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/anuncio.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/widgets/anuncio_grid.dart';
import 'package:ruralflow/widgets/anuncio_grid_anuncio.dart';
import 'package:ruralflow/widgets/drawer.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTA INTERFACE TEM COMO FINALIDADE SER A HOME PAGE DO USUARIO
A PARTIR DELA SERÁ POSSÍVEL REALIZAR A BUSCA DE ANUNCIOS DE OUTROS USUÁRIOS
E PERMITIR A NAVEGAÇÃO PARA OUTRAS FUNCIONALIDADES DA APLICAÇÃO COMO O CADASTRO DE ANUNCIOS.
BUSCA DE ANUNCIOS E OUTROS.
 */
class HomeFlowRural extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /* Ao adicionar um novo produto a lista de produtos exbiidas será atualizada através do  listener  */
    final List<Anuncio> todosAnuncios =
        Provider.of<Anuncios>(context).todosAnuncios;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flow-Rural'),
      ),
<<<<<<< HEAD
      drawer: AppDrawer(),
      body: AnunciosGrid(),
=======
      body: GridView.builder(
        padding: const EdgeInsets.all(
          10,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (ctx, i) => AnuncioGrid(),
        itemCount: 6,
      ),
>>>>>>> f0c9d0af1838e6751c54f86d70b22c5303bc43d5
    );
  }
}
