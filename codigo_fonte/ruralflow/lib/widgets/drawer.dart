import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Bem vindo Usuário!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                RotasFlowRural.HOME,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.view_module),
            title: Text('Anuncios'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                RotasFlowRural.ANUNCIO_GERENCIA,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.create),
            title: Text('Cadastrar Anuncio'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                RotasFlowRural.FORM_CAD_ANUNCIO,
              );
            },
          ),
        ],
      ),
    );
  }
}
