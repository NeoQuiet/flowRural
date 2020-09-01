import 'package:flutter/material.dart';
import 'dart:math';
import '../widgets/form_cad_pessoa_widget.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE ESTÁ INTERFACE TEM COMO FINALIDADE PERSISTIR UM NOVO PERFIL DE USUÁRIO 
 */
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
                  child: Column(
                    children: [
                      Text(
                        'Seja bem vindo!',
                        style:
                            TextStyle(fontSize: 15, fontFamily: 'Courier New'),
                      ),
                      Text(
                        'Complete seu cadastro para desfrutar das melhores ofertas do país!',
                        style:
                            TextStyle(fontSize: 15, fontFamily: 'Courier New'),
                      ),
                    ],
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
