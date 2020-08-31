import 'package:ruralflow/models/pessoa.dart';

class Autenticacao {
  final String id;
  final Pessoa pessoa;
  final String token;

  Autenticacao(this.id, this.pessoa, this.token);
}
