import 'package:flutter/material.dart';
import 'package:ruralflow/widgets/form_cad_anuncio_widget.dart';

class OfertaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ofertar'),
      ),
      body: CadAnuncioForm(),

    );
  }
}
