import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/provider/item_provider.dart';
import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/widgets/list_cad_item.dart';
import '../widgets/drawer.dart';
import '../widgets/list_cad_anuncio.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE ESTÁ INTERFACE TEM COMO FINALIDADE, LISTAR OS itens JÁ CRIADOS E 
PERMITIR QUE O USUÁRIO POSSA CRIAR, EDITAR OU INATIVAR itens. 
 */
class ItensCadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  Navigator.of(context).pushNamed(
                    RotasFlowRural.FORM_CAD_ITEM,
                  );
                  // CadAnuncioForm();
                },
              ),
            ],
            title: Text(
              'Produtos e Serviços',
            ),
          ),
          drawer: AppDrawer(),
          body: _body(context),
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
        //captura o total de itens
        itemCount: itensDados.totalItens,
        //inicia a construção da lista de items
        itemBuilder: (ctx, i) => Column(
          children: [
            //Objeto que captura os itens cadastados e os lista
            ListCadItem(itens[i]),

            //divisor responsavel por desenha uma linha de divisaos
            Divider(),
          ],
        ),
      ),
    ),
  );
}
