import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ruralflow/models/item.dart';
import 'package:ruralflow/models/pessoa_item.dart';

class AnuncioProvider with ChangeNotifier {
  Map<String, PessoaItem> _anunciados = {};

  Map<String, PessoaItem> get anunciados {
    return {..._anunciados};
  }

  int get anunciadosQuantidade {
    return _anunciados.length;
  }

  /* double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  } */

  void addItem(Item item) {
    if (_anunciados.containsKey(item.id)) {
      _anunciados.update(
        item.id,
        (existingItem) => PessoaItem(
          id: existingItem.id,
          descricao: existingItem.descricao,
          valor: existingItem.valor,
          pessoaId: existingItem.pessoaId,
        ),
      );
    } else {
      _anunciados.putIfAbsent(
        item.id,
        () => PessoaItem(
          id: Random().nextDouble().toString(),
          descricao: item.descricao,
          idItem: item.id,
          pessoaId: item.id,
          valor: item.valor,
        ),
      );
    }

    notifyListeners();
  }
}
