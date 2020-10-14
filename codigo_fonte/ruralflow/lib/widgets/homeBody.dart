import 'package:flutter/material.dart';
import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/provider/pessoa_provider.dart';

import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/utils/store.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

//share
Store store;
//objeti
Pessoa pessoa;
//formato de data
final dateFormat = 'DD/MM/YYYY';
//valor da arroba
final valorArroba = 250;
//captura a data atual
final dateTime = DateTime.now();
//versão do aplicativo
final String versaoApp = ('1.9.9');

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //container de boas vindas
        Container(
          child: _boasVindas(),
        ),
        //divisor boas vidas e quadro atualizações
        Divider(),
        //container do quadr de atualizações
        Container(
          child: _quadroAtualizacoes(),
        ),
        //divisor do quadro e das funcionalidades
        Divider(),
        //container linha 1
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            //cor da caixa de botao
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Divider(),
                  _btnPerfil(context),
                  Text('Meu perfil'),
                ],
              ),
              Column(
                children: [
                  _btnBuscar(context),
                  Text('Buscar'),
                ],
              ),
              Column(
                children: [
                  _btnAnuncios(context),
                  Text('Meus Anuncios'),
                ],
              ),
            ],
          ),
        ),
        //conteiner linha 2
        Container(
          padding: EdgeInsets.all(
            10,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            //cor da caixa de botao
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  _btnAbates(context),
                  Text('Meus Abates'),
                ],
              ),
              Column(
                children: [
                  _btnExpedicao(context),
                  Text('Expedição'),
                ],
              ),
              Column(
                children: [
                  _btnSair(context),
                  Text('Sair'),
                ],
              ),
            ],
          ),
        ),
        Divider(),
        //container rodape
        Container(
          child: Column(
            children: [
              _rodape(),
            ],
          ),
        ),
      ],
    );
  }
}

//função cria botao que redireciona para pagina de busca
_btnBuscar(context) {
  return IconButton(
      color: Colors.brown,
      constraints: BoxConstraints(
        minHeight: 80,
        minWidth: 80,
        maxHeight: 100,
        maxWidth: 200,
      ),
      tooltip: 'Buscar',
      iconSize: 50,
      icon: Icon(
        Icons.search,
      ),
      onPressed: () {
        Navigator.pushNamed(context, RotasFlowRural.BUSCAR);
      });
}

_btnAbates(context) {
  return IconButton(
      color: Colors.brown,
      constraints: BoxConstraints(
        minHeight: 80,
        minWidth: 80,
        maxHeight: 100,
        maxWidth: 200,
      ),
      tooltip: 'Abates',
      iconSize: 50,
      icon: Icon(
        Icons.access_time,
      ),
      onPressed: () {
        Navigator.pushNamed(context, RotasFlowRural.BUSCAR);
      });
}

_btnAnuncios(context) {
  return IconButton(
      color: Colors.brown,
      constraints: BoxConstraints(
        minHeight: 80,
        minWidth: 80,
        maxHeight: 100,
        maxWidth: 200,
      ),
      iconSize: 50,
      tooltip: 'Meus anuncios',
      icon: Icon(
        Icons.access_time,
      ),
      onPressed: () {
        Navigator.pushNamed(context, RotasFlowRural.ANUNCIO_GERENCIA);
      });
}

_btnExpedicao(context) {
  return IconButton(
      color: Colors.brown,
      constraints: BoxConstraints(
        minHeight: 80,
        minWidth: 80,
        maxHeight: 100,
        maxWidth: 200,
      ),
      iconSize: 50,
      tooltip: 'Expedição',
      icon: Icon(
        Icons.access_time,
      ),
      onPressed: () {
        Navigator.pushNamed(context, RotasFlowRural.BUSCAR);
      });
}

_btnSair(context) {
  return IconButton(
      color: Colors.grey,
      constraints: BoxConstraints(
        minHeight: 80,
        minWidth: 80,
        maxHeight: 100,
        maxWidth: 200,
      ),
      iconSize: 50,
      tooltip: 'Sair',
      icon: Icon(
        Icons.access_time,
      ),
      onPressed: () {
        Navigator.pushNamed(context, RotasFlowRural.AUTENTICACAO_HOME);
      });
}

_btnPerfil(context) {
  return IconButton(
      color: Colors.grey,
      constraints: BoxConstraints(
        minHeight: 80,
        minWidth: 80,
        maxHeight: 100,
        maxWidth: 200,
      ),
      tooltip: 'Meu Perfil',
      iconSize: 50,
      icon: Icon(
        Icons.person,
      ),
      onPressed: () {
        Navigator.pushNamed(context, RotasFlowRural.PESSO_CAD_VIEW);
      });
}

_boasVindas() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Seja bem vindo, $pessoa',
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
  );
}

_quadroAtualizacoes() {
  return Card(
    elevation: 10,
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              ' Hoje é dia $dateTime',
            )
          ],
        ),
        Divider(),
        Row(
          children: [
            Text(
              'O valor da Arroba é $valorArroba',
            )
          ],
        ),
      ],
    ),
  );
}

_rodape() {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Versão do Aplicativo $versaoApp',
            style: TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ]);
}
