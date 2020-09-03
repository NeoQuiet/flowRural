import 'package:flutter/material.dart';
import 'package:ruralflow/widgets/anuncio_placa.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Flow-Rural'),
      ),
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
    );
  }
}
