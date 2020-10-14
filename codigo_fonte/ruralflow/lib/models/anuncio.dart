import 'package:flutter/foundation.dart';

class Anuncio with ChangeNotifier {
  final String id;
  final String idPessoa;
  final String tipoAnuncio;
  final String descricao;
  final String anuncio;
  final String qtde;
  final String valor;
  final String dtExpiracao;
  final String unMedida;

  Anuncio({
    this.descricao,
    this.tipoAnuncio,
    this.qtde,
    this.valor,
    this.id,
    this.anuncio,
    this.idPessoa,
    this.dtExpiracao,
    this.unMedida,
  });
}
