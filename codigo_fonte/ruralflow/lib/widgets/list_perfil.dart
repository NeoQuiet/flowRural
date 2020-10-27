import 'package:flutter/material.dart';

import 'package:ruralflow/models/Pessoa.dart';

class VisualizaPerfilPessoa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pessoa pessoa = ModalRoute.of(context).settings.arguments as Pessoa;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Divider(
            color: Colors.black,
          ),
          Container(
            color: Colors.white,
            height: 300,
            width: double.infinity,
            child: CircleAvatar(
              radius: 350,
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/images/pessoaicone.jpg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Text(
            'pessoa.nome',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' Pessoa interessadas',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                label: Text('30'),
              )
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Text(
                ' Endereço:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                ' Fazenda do Gado ,',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              Text(
                ' S/N',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Text(
                ' Local:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                ' Ibaiti ,',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              Text(
                ' Paraná',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Text(
                ' Telefone:',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                ' 43 96502289',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              Text(
                ' - 43 96502289',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ],
      ),
    );
  }
}
