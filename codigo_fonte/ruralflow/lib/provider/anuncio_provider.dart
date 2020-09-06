import 'package:flutter/cupertino.dart';
import 'package:ruralflow/models/anuncio.dart';

/* esta classe contem todos os anuncios e metodos */
class Anuncios with ChangeNotifier {
  List<Anuncio> _todosAnuncios = [];

  List<Anuncio> get todosAnuncios => [..._todosAnuncios];

  int get totalAnuncios {
    return _todosAnuncios.length;
  }

  void adicionarAnuncio(Anuncio pAnuncio) {
    _todosAnuncios.add(pAnuncio);
    notifyListeners();
  }
}
