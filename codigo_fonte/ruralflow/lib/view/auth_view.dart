import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ruralflow/widgets/auth_card.dart';

class Autenticacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final image =
        Image.network('https://i2.ytimg.com/vi/YwzV8MMWc5g/mqdefault.jpg');

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
                    'Flow Rural',
                    style:
                        TextStyle(fontSize: 45, fontFamily: 'Times New Roman'),
                  ),
                ),
                LoginCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
