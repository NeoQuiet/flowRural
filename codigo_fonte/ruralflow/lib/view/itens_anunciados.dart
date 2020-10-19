import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/item.dart';

import 'package:ruralflow/widgets/list_cad_item.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE ESTÁ INTERFACE TEM COMO FINALIDADE, LISTAR OS ANUNCIOS JÁ CRIADOS E 
PERMITIR QUE O USUÁRIO POSSA CRIAR, EDITAR OU INATIVAR ANUNCIOS. 
 */
class ProdutosView extends StatelessWidget {
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
                  // CadAnuncioForm();
                },
              ),
            ],
            title: Text(
              'Buscar',
            ),
          ),
          body: _futureBuilder(context),
        ),
      ],
    );
  }
}

_body(context) {
  final itensDados = Provider.of<ItemProvider>(context);
  final itens = itensDados.todositens;
  return Container(
    child: Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        //captura o total de anuncios
        itemCount: itensDados.totalItens,
        //inicia a construção da lista de items
        itemBuilder: (ctx, i) => Column(
          children: [
            //Objeto que captura os anuncios cadastados e os lista
            ListCadItem(itens[i]),
            //divisor responsavel por desenha uma linha de divisaos
            Divider(color: Colors.red),
          ],
        ),
      ),
    ),
  );
}

_futureBuilder(context) {
  return FutureBuilder(
    future: Provider.of<ItemProvider>(context, listen: false).carregarItem(),
    builder: (ctx, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.error != null) {
        return Center(child: Text('Ocorreu um erro!'));
      } else {
        return Consumer<ItemProvider>(
          builder: (ctx, itens, child) {
            return ListView.builder(
              itemCount: itens.totalItens,
              itemBuilder: (ctx, i) => Column(
                children: [
                  ListCadItem(
                    itens.todositens[i],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
              padding: EdgeInsets.all(
                10,
              ),
            );
          },
        );
      }
    },
  );
}
