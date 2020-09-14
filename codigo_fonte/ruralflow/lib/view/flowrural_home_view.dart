import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/pessoa.dart';

import 'package:ruralflow/provider/pessoa_provider.dart';
import 'package:ruralflow/widgets/anuncio_grid.dart';
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

  // lista que retorna a buscar por pessoa
  List<String> _pessoa;

  //boolean está pesquisando
  bool _IsSearching;
  //texto pesquisado
  String _searchText = "";

  _HomeFlowRuralState() {
    _pesquisaQuery.addListener(() {
      if (_pesquisaQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = " ";
        });
      } else {
        setState(() {
          _IsSearching = true;
          _searchText = _pesquisaQuery.text;
        });
      }
    });
  }

  bool _isLoading = true;
  @override
  void initState() {
    super.initState();

    Provider.of<Pessoas>(context, listen: false).loadPessoas().then((_) {
      setState(() {
        _isLoading = false;
        _IsSearching = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // pessoas

    return new Scaffold(
      appBar: buildBar(context),
      drawer: AppDrawer(),
      body: AnunciosGrid(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text('Flow-Rural'),
    );
  }

  List<Pessoas> _buildList() {
    return _pessoa.map((contact) => new Pessoas(contact)).toList();
  }

  List<Pessoas> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _pessoa.map((contact) => new Pessoas(contact)).toList();
    } else {
      List<String> _searchList = List();
      for (int i = 0; i < _pessoa.length; i++) {
        String name = _pessoa.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new Pessoas(contact)).toList();
    }
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
    setState(() {
      _IsSearching = true;
    });
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
        _IsSearching = false;
        _pesquisaQuery.clear();
      },
    );
  }
}
