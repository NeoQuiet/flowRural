/* import 'dart:math';

import 'package:flutter/foundation.dart';

class NotificacaoItem {
  final String id;
  final String itemId;
  final String descricao;
  final int quantidade;
  final double valor;

  NotificacaoItem({
    @required this.id,
    @required this.itemId,
    @required this.descricao,
    @required this.quantidade,
    @required this.valor,
  });
}

class Notificacao with ChangeNotifier {
  Map<String, NotificacaoItem> _itens = {};

  Map<String, NotificacaoItem> get itens {
    return {..._itens};
  }

  int get itensQuantidade {
    return _itens.length;
  }

  double get totalAmount {
    double total = 0.0;
    _itens.forEach((key, NotificacaoItem) {
      total += NotificacaoItem.price * NotificacaoItem.quantity;
    });
    return total;
  }

  void addItem(Product product) {
    if (_itens.containsKey(product.id)) {
      _itens.update(
        product.id,
        (existingItem) => NotificacaoItem(
          id: existingItem.id,
          productId: product.id,
          title: existingItem.title,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        ),
      );
    } else {
      _itens.putIfAbsent(
        product.id,
        () => NotificacaoItem(
          id: Random().nextDouble().toString(),
          productId: product.id,
          title: product.title,
          price: product.price,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    _itens.remove(productId);
    notifyListeners();
  }

  void clear() {
    _itens = {};
    notifyListeners();
  }
}
 */
