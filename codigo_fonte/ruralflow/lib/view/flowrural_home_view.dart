import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/pessoa.dart';
import 'package:ruralflow/widgets/homeBody.dart';
import 'package:ruralflow/widgets/drawer.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTA INTERFACE TEM COMO FINALIDADE SER A HOME PAGE DO USUARIO
A PARTIR DELA SERÁ POSSÍVEL REALIZAR A BUSCA DE ANUNCIOS DE OUTROS USUÁRIOS
E PERMITIR A NAVEGAÇÃO PARA OUTRAS FUNCIONALIDADES DA APLICAÇÃO COMO O CADASTRO DE ANUNCIOS.
BUSCA DE ANUNCIOS E OUTROS.
 */
class HomeFlowRural extends StatefulWidget {
  @override
  _HomeFlowRuralState createState() => _HomeFlowRuralState();
}

class _HomeFlowRuralState extends State<HomeFlowRural> {
  // titulo da appBar
  Widget appBarTitle = new Text(
    "FLOW RURAL",
    style: new TextStyle(color: Colors.white),
  );
  // icone pesquisa da appbar
  Icon actionIconBuscar = new Icon(
    Icons.search,
    color: Colors.white,
  );

  // nova chave para o scaffold
  final key = new GlobalKey<ScaffoldState>();
  //controller para o texto pesquisado
  final TextEditingController _pesquisaQuery = new TextEditingController();

  //boolean está pesquisando

  //texto pesquisado

  _HomeFlowRuralState() {
    _pesquisaQuery.addListener(() {
      if (_pesquisaQuery.text.isEmpty) {
        setState(() {});
      } else {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();

    Provider.of<Pessoas>(context, listen: false).loadPessoas().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // pessoas

    return new Scaffold(
      appBar: buildBar(context),
      drawer: AppDrawer(),
      body: HomeBody(),
    );
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: appBarTitle,
      actions: <Widget>[
        new IconButton(
          icon: actionIconBuscar,
          onPressed: () {
            setState(() {
              if (this.actionIconBuscar.icon == Icons.search) {
                this.actionIconBuscar = new Icon(
                  Icons.filter_list,
                  color: Colors.white,
                );
                this.appBarTitle = new TextField(
                  controller: _pesquisaQuery,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Buscar...",
                      hintStyle: new TextStyle(color: Colors.white)),
                );
                _handleSearchStart();
              } else {
                _handleSearchEnd();
              }
            });
          },
        ),
      ],
    );
  }

  void _handleSearchStart() {
    setState(() {});
  }

  void _handleSearchEnd() {
    setState(
      () {
        this.actionIconBuscar = new Icon(
          Icons.search,
          color: Colors.white,
        );

        this.appBarTitle = new Text(
          "FLOW RURAL",
          style: new TextStyle(color: Colors.white),
        );

        _pesquisaQuery.clear();
      },
    );
  }
}
