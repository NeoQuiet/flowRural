import 'package:flutter/material.dart';
import 'package:ruralflow/widgets/list_notificacao.dart';

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
        actions: [
          FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.format_align_left_rounded,
              color: Colors.white,
            ),
            label: Text(''),
          )
        ],
      ),
      body: _body(context),
    );
  }
}

_body(context) {
  return ListNotificacao();
}
