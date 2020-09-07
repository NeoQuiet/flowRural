import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/widgets/anuncio_grid_anuncio.dart';

/* Classe responsavel por exibir os anuncios em forma de grid  */
class AnunciosGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final anunciosProvider = Provider.of<Anuncios>(context);
    final anuncio = anunciosProvider.todosAnuncios;
    return GridView.builder(
      padding: const EdgeInsets.all(
        10,
      ),
      itemCount: anunciosProvider.totalAnuncios,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: anuncio[i],
        child: GridAnuncio(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
      ),
    );
  }
}
