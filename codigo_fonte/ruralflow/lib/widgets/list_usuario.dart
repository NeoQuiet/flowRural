import 'package:flutter/material.dart';
import 'package:ruralflow/utils/app_routes.dart';

class ListaUsuarioVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              'Antonio José',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Comércio\nBovinos e Derivados\nIbaiti - Paraná',
              maxLines: 3,
            ),
            isThreeLine: true,
            onTap: () {},
            trailing: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        RotasFlowRural.VISUALIZAR_VIDEO,
                      );
                    },
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
              'Quitanda do Alceu',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Comércio\nFrutas e Verduras\nIbaiti - Paraná',
              maxLines: 3,
            ),
            isThreeLine: true,
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
          Divider(),
          ListTile(
            tileColor: Colors.red[300],
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/pessoaicone.jpg'),
            ),
            title: Text(
              'Caio Rodrigo ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Comprando\nBovinos e derivados\nIbaiti - Paraná',
              maxLines: 3,
            ),
            isThreeLine: true,
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
          Divider(),
          ListTile(
            tileColor: Colors.orange,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/pessoaicone.jpg'),
            ),
            title: Text(
              'Frigorifico do Alencar ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Serviços\nBovinos\nIbaiti - Paraná',
              maxLines: 3,
            ),
            isThreeLine: true,
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
          Divider(),
          ListTile(
            tileColor: Colors.green,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/pessoaicone.jpg'),
            ),
            title: Text(
              'Mercado da Mary Jane',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Comércio\nDiversos produtos Rurais\nIbaiti - Paraná',
              maxLines: 3,
            ),
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
          Divider(),
          ListTile(
            tileColor: Colors.blueAccent,
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/pessoaicone.jpg'),
            ),
            title: Text(
              'Antonio José',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Vendendo\nMorango\nJaboti - Paraná',
              maxLines: 3,
            ),
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
          Divider(),
          ListTile(
            tileColor: Colors.red[300],
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/pessoaicone.jpg'),
            ),
            title: Text(
              'Antonio José',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'Comprando\nFrutas e Verduras\nIbaiti - Paraná',
              maxLines: 3,
            ),
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
          Divider(),
        ],
      ),
    );
  }
}
