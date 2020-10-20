import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/pedido.dart';
import 'package:ruralflow/provider/item.dart';
import 'package:ruralflow/provider/pedido.dart';

import 'package:ruralflow/widgets/list_cad_item.dart';
import 'package:ruralflow/widgets/list_pedido.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE ESTÁ INTERFACE TEM COMO FINALIDADE, LISTAR OS ANUNCIOS JÁ CRIADOS E 
PERMITIR QUE O USUÁRIO POSSA CRIAR, EDITAR OU INATIVAR ANUNCIOS. 
 */
class PedidosView extends StatelessWidget {
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
              'Pedidos',
            ),
          ),
          body: Column(
            children: [
              _card(),
              Divider(color: Colors.black),
              ListPedidos(),
            ],
          ),
        ),
      ],
    );
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
              ListPedidos(),
              //divisor responsavel por desenha uma linha de divisaos
              Divider(color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}

_futureBuilder(context) {
  return FutureBuilder(
    future: Provider.of<Pedidos>(context, listen: false).loadPedidos(),
    builder: (ctx, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.error != null) {
        return Center(child: Text('Ocorreu um erro!'));
      } else {
        return Consumer<Pedidos>(
          builder: (ctx, pessoas, child) {
            return ListView.builder(
              itemCount: pessoas.totalPedido,
              itemBuilder: (ctx, i) => Column(
                children: [
                  ListPedidos(),
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

_card() {
  return Card(
    margin: EdgeInsets.all(25),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Compras',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 10,
                height: 30,
              ),
              Chip(
                label: Text(
                  'R\$ 5,000.00',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
              Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Vendas ',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(width: 10),
              Chip(
                label: Text(
                  'R\$ 5,000.00',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    ),
  );
}
