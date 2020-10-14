import 'package:flutter/material.dart';

class NotificacaoView extends StatefulWidget {
  @override
  _NotificacaoViewState createState() => _NotificacaoViewState();
}

class _NotificacaoViewState extends State<NotificacaoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
      ),
      body: _body(context),
    );
  }
}

_body(context) {
  return Column();
}
