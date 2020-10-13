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
              IconButton(
                icon: Icon(
                  Icons.insert_comment,
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
              'FLOW RURAL',
            ),
          ),
          drawer: AppDrawer(),
          body: _body(context),
        ),
        Container(
          height: 100,
          margin: EdgeInsetsDirectional.only(
            start: 250,
            top: 475,
          ),
          width: 75,
          child: FloatingActionButton(
            backgroundColor: Colors.green[300],
            elevation: 10,
            child: Icon(
              Icons.add,
              color: Colors.yellow[300],
              size: 40,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                RotasFlowRural.FORM_CAD_PRODUTO,
              );
              // CadAnuncioForm();
            },
          ),
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
                    'Estabelecimentos',
                  ),
                ],
              ),
            ),

            //divisor responsavel por desenha uma linha de divisaos
            Divider(),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RotasFlowRural.PRODUTOS_VIEW,
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
                    'Produtos',
                  ),
                ],
              ),
            ),
            Divider(),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RotasFlowRural.ANUNCIADOS_VIEW,
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/anunciados.jpg',
                    height: 150,
                    width: 100,
                  ),
                  Divider(
                    color: Colors.red,
                  ),
                  Text(
                    'Anunciados',
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
