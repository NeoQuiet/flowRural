

import 'package:flutter/material.dart';

class AbatesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Abates')
    ),
    body: _body(),
    );
  }


  _body(){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container
    (decoration: BoxDecoration(
        border: Border.all(width: 10)
    ,)

    ,width: 400,
    height: 200,
    child: Column(
      children: [TextFormField(
              decoration: const InputDecoration(
                hintText: 'Digite a raça do animal',
              )),
        Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
           _abatidos(),_emAbate(),_emEspera(),],),
      ],
    ),
    ),
      )
    ,_body2()],
    );
  }
  _body2(){
     return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container
    (decoration: BoxDecoration(
        border: Border.all(width: 10)
    ,)

    ,width: 400,
    height: 200,
    child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [_raca()],),
    ),
      )
    ],
    );
  }

  _abatidos(){
    return Column(children: [Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Abatidos'),
    ),CircleAvatar(backgroundColor: Colors.green,),Text('200')],mainAxisAlignment: MainAxisAlignment.center,);
  }
  _emAbate(){
    return Column(children: [Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Em abate'),
    ),CircleAvatar(backgroundColor: Colors.blue,),Text('200')],mainAxisAlignment: MainAxisAlignment.center,);
  }
  _emEspera(){
    return Column(children: [Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Em espera'),
    ),CircleAvatar(backgroundColor: Colors.red,),Text('15')],mainAxisAlignment: MainAxisAlignment.center,);
  }

  _raca(){
    return Column(children: [Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Raça'),
    ),Text('Nelore'),Text('15'),Text('Total abatido'),Text('200')],mainAxisAlignment: MainAxisAlignment.center,);
  }
}