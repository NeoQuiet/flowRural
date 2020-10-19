import 'package:flutter/cupertino.dart';

class Pedido with ChangeNotifier {
  final String id;
  final String idTipo;
  final double valor;
  final double quantidade;

  Pedido({
    this.quantidade,
    this.id,
    this.idTipo,
    this.valor,
  });
}
