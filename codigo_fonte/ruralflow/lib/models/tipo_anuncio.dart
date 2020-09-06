import 'package:ruralflow/models/tipo_frigo_anuncio.dart';

class TipoAnuncio {
  final int id;
  final String descricao;
  final bool venda;
  final FrigoAnuncio frigorifico;

  TipoAnuncio(
    this.id,
    this.descricao,
    this.venda,
    this.frigorifico,
  );
}
