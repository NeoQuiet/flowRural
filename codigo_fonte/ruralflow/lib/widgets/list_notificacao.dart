import 'package:flutter/material.dart';

import 'package:ruralflow/models/pedido.dart';

class ListNotificacao extends StatelessWidget {
  final Pedido pedido;

  const ListNotificacao({this.pedido});

  @override
  Widget build(BuildContext context) {
    // scaffold
    final scaffold = Scaffold.of(context);
    // lista em forma tijolo
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            tileColor: Colors.green,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/pessoaicone.jpg'),
            ),
            title: Text(
              'Quer negociar . . .',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text('Caio Rodrigo'),
            onTap: () {},
            trailing: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Ver',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            tileColor: Colors.green,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/pessoaicone.jpg'),
            ),
            title: Text(
              'Comprou . . .',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text('Caio Rodrigo'),
            onTap: () {},
            trailing: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.playlist_add_check_sharp,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Enviar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            tileColor: Colors.green,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/pessoaicone.jpg'),
            ),
            title: Text(
              'Contratou seu serviço . . .',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text('Caio Rodrigo'),
            onTap: () {},
            trailing: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.access_alarms_sharp,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Marcar data',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            tileColor: Colors.green,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/pessoaicone.jpg'),
            ),
            title: Text(
              'Marcou seu perfil como interessante . . .',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text('Caio Rodrigo'),
            onTap: () {},
            trailing: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Ver',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
