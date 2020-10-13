import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/auth.dart';
import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = new Auth();
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Bem vindo, Visitante'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                RotasFlowRural.HOME,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.view_module),
            title: Text('Anuncios/Produtos'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                RotasFlowRural.ANUNCIO_GERENCIA,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.kitchen),
            title: Text('Compras e Vendas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                RotasFlowRural.ABATES_VIEW,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
