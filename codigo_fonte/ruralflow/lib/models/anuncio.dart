import 'package:flutter/foundation.dart';

class Anuncio with ChangeNotifier {
  final String id;
  final String anuncio;
  final String qtde;
  final String valor;
  

  Anuncio({
    this.qtde,
    this.valor,
    this.id,
    @required this.anuncio,
  });
}
