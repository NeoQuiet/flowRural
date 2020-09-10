import 'package:flutter/material.dart';

class FormRegistrar extends StatefulWidget {
  @override
  _FormRegistrarState createState() => _FormRegistrarState();
}

class _FormRegistrarState extends State<FormRegistrar> {


  final _formulario = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _formulario,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                ),TextFormField(
                  decoration: InputDecoration(labelText: 'Confirme a Senha'),
                  obscureText: true,
                ),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      " ",
                    ),),
              ],
            )),
      ),
    );
  }
}