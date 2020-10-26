import 'package:flutter/material.dart';

import 'package:ruralflow/models/pedido.dart';

class ListPedidos extends StatelessWidget {
  final Pedido pedido;

  const ListPedidos({this.pedido});

  @override
  Widget build(BuildContext context) {
    // scaffold
    final scaffold = Scaffold.of(context);
    // lista em forma tijolo
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/lojaicone.png'),
          ),
          title: Text(
            'Boi para reprodução',
            maxLines: 3,
          ),
          isThreeLine: true,
          subtitle: Text('Compra\nCaio Rodrigo\n07-02-2020'),
          onTap: () {},
          trailing: Container(
            margin: EdgeInsets.all(5),
            width: 150,
            height: 350,
            child: Row(
              children: [
                Text('Valor R\$5,000,00'),
              ],
            ),
          ),
        ),
        Divider(color: Colors.black),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/images/lojaicone.png'),
          ),
          title: Text('Boi para abate'),
          subtitle: Text('Venda\nCaio Rodrigo\n08-02-2020'),
          onTap: () {},
          trailing: Container(
            margin: EdgeInsets.all(5),
            width: 150,
            height: 350,
            child: Row(
              children: [
                Text('Valor R\$5,000,00'),
              ],
            ),
          ),
        ),
        Divider(color: Colors.black),
      ],
    );
  }
}
