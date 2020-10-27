import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ruralflow/widgets/form_autenticacao.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTA INTERFACE, TEM COMO FUNÇÃO A EXIBIÇÃO DO FORMULARIO DE LOGIN E CADASTRO DE EMAIL E SENHA
*/
class AutenticacaoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/auth2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
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
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    'FLOW RURAL',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
                AutenticacaoCartao(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
