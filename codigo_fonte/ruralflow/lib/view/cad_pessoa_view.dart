import 'package:flutter/material.dart';
import 'dart:math';
import '../widgets/cad_pessoa_widget.dart';

class CadPessoaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                  transform: Matrix4.rotationZ(0 * pi / 180),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Seja bem vindo!' +
                        'Complete seu cadastro para desfrutar das ofertas no Flow Rural',
                    style: TextStyle(fontSize: 15, fontFamily: 'Courier New'),
                  ),
                ),
                CadPessoaForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
