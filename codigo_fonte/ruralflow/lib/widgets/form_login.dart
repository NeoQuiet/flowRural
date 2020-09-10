import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {


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
                ),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      " ENTRAR ",

                    ),),
                    Row(
                      children: [
                        Text('Se não é cadastrado'),FlatButton(onPressed: (){}, child:Text('cadastre-se',style: TextStyle(color: Colors.blue),),)
                      ],
                    ),
              ],
            ),),
      ),
    );
  }
}