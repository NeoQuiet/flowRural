import 'package:flutter/foundation.dart';

class Anuncio with ChangeNotifier {
  final String id;
  final String idPessoa;
  final String descricao;
  final String anuncio;
  final String qtde;
  final String valor;

  Anuncio({
    this.descricao,
    this.qtde,
    this.valor,
    this.id,
    this.anuncio,
    this.idPessoa,
  });
}
