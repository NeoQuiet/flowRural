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
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRotas.HOME,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRotas.HOME,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.swap_horiz),
            title: Text('Entradas e Saidas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRotas.HOME,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.store_mall_directory),
            title: Text('Anuncios'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRotas.HOME,
              );
            },
          ),
        ],
      ),
    );
  }
}
