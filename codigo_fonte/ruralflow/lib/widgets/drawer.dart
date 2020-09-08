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
            leading: Icon(Icons.person),
            title: Text('Propostas'),
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
            leading: Icon(Icons.kitchen),
            title: Text('Abates'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                RotasFlowRural.ABATES_VIEW,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Entradas e Saidas'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                RotasFlowRural.FLUXO_VIEW,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.traffic),
            title: Text('Expedição de animais'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                RotasFlowRural.EXPEDICAO_VIEW,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.keyboard_capslock),
            title: Text('Configurações'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                RotasFlowRural.ANUNCIO_GERENCIA,
              );
            },
          ),
        ],
      ),
    );
  }
}
