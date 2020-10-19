import 'package:flutter/material.dart';

import 'package:ruralflow/utils/app_routes.dart';

import 'package:ruralflow/widgets/drawer.dart';

class BuscaView extends StatefulWidget {
  @override
  _BuscaViewState createState() => _BuscaViewState();
}

class _BuscaViewState extends State<BuscaView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            actions: [
              FlatButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10),
                ),
                child: Text(
                  'NOTIFICAÇÕES',
                  style: TextStyle(
                    color: Colors.white,
                  ),
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
              'FLOW RURAL',
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
  return Container(
    child: Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        //captura o total de anuncios
        itemCount: 1,
        //inicia a construção da lista de items
        itemBuilder: (ctx, i) => Column(
          children: [
            //Objeto que captura os anuncios cadastados e os lista
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RotasFlowRural.LOJAS_VIEW,
                );
              },
              child: Column(
                children: [
                  Divider(),
                  Image.asset(
                    'assets/images/lojaicone.png',
                    height: 150,
                    width: 100,
                  ),
                  Divider(
                    color: Colors.red,
                  ),
                  Text(
                    'Estabelecimentos e Pessoas',
                  ),
                ],
              ),
            ),

            //divisor responsavel por desenha uma linha de divisaos
            Divider(),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RotasFlowRural.ITENS_VIEW,
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/icone-produtos.png',
                    height: 150,
                    width: 100,
                  ),
                  Divider(
                    color: Colors.red,
                  ),
                  Text(
                    'Produtos e Serviços',
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    ),
  );
}
