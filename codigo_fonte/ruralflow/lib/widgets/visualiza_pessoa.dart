import 'package:flutter/material.dart';

import 'package:ruralflow/models/Pessoa.dart';

class VisualizaPessoa extends StatelessWidget {
  final Pessoa pessoa;

  VisualizaPessoa(this.pessoa);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.deepOrange,
            height: 300,
            width: double.infinity,
            child: Image.asset(
              'assets/images/lojaicone.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            ' Nome',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          Text(
            ' Nome',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(
              'pessoa.email',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
