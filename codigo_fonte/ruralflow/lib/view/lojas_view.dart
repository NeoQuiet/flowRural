import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/widgets/list_cad_lojas.dart';
import 'package:ruralflow/widgets/list_perfil_video.dart';
import 'package:ruralflow/widgets/list_usuario.dart';
import '../provider/pessoa.dart';
import '../widgets/drawer.dart';
import '../widgets/list_cad_anuncio.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE ESTÁ INTERFACE TEM COMO FINALIDADE, LISTAR OS ANUNCIOS JÁ CRIADOS E 
PERMITIR QUE O USUÁRIO POSSA CRIAR, EDITAR OU INATIVAR ANUNCIOS. 
 */
class LojasView extends StatelessWidget {
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
                    RotasFlowRural.NOTIFICACOES,
                  );
                  // CadAnuncioForm();
                },
              ),
            ],
            title: Text(
              'Buscar ',
            ),
          ),
          body: _futureBuilder(context),
        ),
      ],
    );
  }
}

_body(context) {
  final pessoasDados = Provider.of<Pessoas>(context);
  final pessoas = pessoasDados.todasPessoas;
  return Container(
    child: Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        //captura o total de anuncios
        itemCount: pessoasDados.totalPessoa,

        //inicia a construção da lista de items
        itemBuilder: (ctx, i) => Column(
          children: [
            //Objeto que captura os anuncios cadastados e os lista
            ListCadLoja(pessoas[i]),

            //divisor responsavel por desenha uma linha de divisaos
            Divider(),
          ],
        ),
      ),
    ),
  );
}

_futureBuilder(context) {
  return FutureBuilder(
    future: Provider.of<Pessoas>(context, listen: false).loadPessoas(),
    builder: (ctx, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.error != null) {
        return Center(child: Text('Ocorreu um erro!'));
      } else {
        return Consumer<Pessoas>(
          builder: (ctx, pessoas, child) {
            return ListView.builder(
              itemCount: pessoas.totalPessoa,
              itemBuilder: (ctx, i) => Column(
                children: [
                  ListaUsuarioVideo(),
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
