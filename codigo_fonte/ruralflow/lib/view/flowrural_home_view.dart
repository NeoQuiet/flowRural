import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {
    super.initState();
    Provider.of<Pessoas>(context, listen: false).loadPessoas().then((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_appBar(),
      drawer: AppDrawer(),
      body: AnunciosGrid(),
    );
  }
  

  _appBar(){
    return AppBar(
        title: Text('Flow-Rural'),
    );
  }




}
