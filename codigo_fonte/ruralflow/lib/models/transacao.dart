import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ruralflow/models/anuncio.dart';

class Transacao with ChangeNotifier {
  String id;
  Anuncio anuncio;

  Map<String, Transacao> _trans = {};

  Map<String, Transacao> get trans {
    return {..._trans};
  }

  int get transQtde {
    return _trans.length;
  }

  double get vlrTotal {
    double total = 0.0;
    _trans.forEach((key, transAnuncio) {
      total += anuncio.valor * anuncio.qtde;
    });
    return total;
  }

  void addAnuncioTrans(Anuncio pAnuncio) {
    if (_trans.containsKey(pAnuncio.id)) {
      _trans.update(
        pAnuncio.id,
        (existingItem) => Transacao(id: existingItem.id, anuncio: anuncio),
      );
    } else {
      _trans.putIfAbsent(
        pAnuncio.id,
        () => Anuncio(
          id: Random().nextDouble().toString(),
          peso: pAnuncio.peso,
          descricao: pAnuncio.descricao,
          valor: pAnuncio.valor,
          qtde: 1,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String anuncioId) {
    _trans.remove(anuncioId);
    notifyListeners();
  }

  void clear() {
    _trans = {};
    notifyListeners();
  }
}
