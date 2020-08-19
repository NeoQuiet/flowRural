import 'package:flutter/material.dart';
import 'package:ruralflow/models/anuncio.dart';

class AnuncioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Anuncio anuncio =
        ModalRoute.of(context).settings.arguments as Anuncio;
    return Scaffold(
      appBar: AppBar(
        title: Text('Descricao'), //descricao do anuncio
      ),
    );
  }
}
