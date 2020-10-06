import 'package:flutter/material.dart';
import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/widgets/anuncio_grid.dart';
import 'package:ruralflow/widgets/drawer.dart';

class BuscaView extends StatefulWidget {
  @override
  _BuscaViewState createState() => _BuscaViewState();
}

class _BuscaViewState extends State<BuscaView> {
  //controller para o texto pesquisado
  final TextEditingController _pesquisaQuery = new TextEditingController();
  //icone buscar app-bar
  final iconAppBar = Icon(Icons.search);
  //titulo da app-bar
  final tituloAppBar = Text('Buscarr');
  //boolean está pesquisando

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: this.tituloAppBar,
        actions: <Widget>[
          new IconButton(
            icon: iconAppBar,
            onPressed: () {},
          ),
        ],
      ),
      body: AnunciosGrid(),
    );
  }
}
