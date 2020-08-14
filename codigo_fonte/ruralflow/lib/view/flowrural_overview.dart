import 'package:flutter/material.dart';
import 'package:ruralflow/widgets/anuncio_placa.dart';

class HomeFlowRural extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flow-Rural'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(
          10,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (ctx, i) => AnuncioPlaca(),
        itemCount: 6,
      ),
    );
  }
}
