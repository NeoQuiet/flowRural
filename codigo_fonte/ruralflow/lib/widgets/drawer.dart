import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/autenticacao.dart';
import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/provider/auth.dart';
import 'package:ruralflow/provider/pessoa.dart';
import '../utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _drawer(),
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.home_filled),
                title: Text('Principal'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                    RotasFlowRural.BUSCAR,
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Meu Perfil'),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RotasFlowRural.PERFIL_PESSOA,
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.view_module),
                title: Text('Meus Produtos e Serviços'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(
                    RotasFlowRural.ITENS_GERENCIA,
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.stairs),
                title: Text('Minhas Compras e Vendas'),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RotasFlowRural.PEDIDOS,
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sair'),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    RotasFlowRural.AUTENTICACAO_HOME,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  _drawer() {
    Autenticacao usuario;

    return UserAccountsDrawerHeader(
      accountName: Text('emailpessoa'),
      accountEmail: Text('caio@flowrural.com.br'),
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      otherAccountsPictures: [
        Image.asset(
          'assets/images/pessoaicone.jpg',
          scale: 15,
        )
      ],
    );
  }
}

_body2(context) {
  final pessoas = Provider.of<Pessoas>(context);
  final pessoa = pessoas;
  return Container();
}
