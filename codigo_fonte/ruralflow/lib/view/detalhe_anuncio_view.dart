import 'package:flutter/material.dart';


import 'package:ruralflow/models/pessoa.dart';

import 'package:ruralflow/utils/app_routes.dart';


class DetalheAnuncioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    final Pessoa pessoa = ModalRoute.of(context).settings.arguments as Pessoa;

    return Scaffold(
      appBar: AppBar(
        title: Text(pessoa.nome),
        actions: [
          IconButton(
            icon: Icon(
              Icons.local_offer,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
                RotasFlowRural.FORM_CAD_OFERTA,
              );
            },
          )
        ], //descricao do anuncio
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 500,
            margin: EdgeInsets.only(
              top: 8,
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: Text('Imagem'),
          ),
          Text(
            pessoa.nome,
            style: TextStyle(
              fontSize: 40,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                pessoa.endereco,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(
            pessoa.telefone,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            'Compra-se',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Boi gordo @'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        maxRadius: 20,
                        child: Text(
                          '250',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text('A vista'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
