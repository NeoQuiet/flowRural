import 'package:ruralflow/models/endereco.dart';
import 'package:ruralflow/models/fisica_pessoa.dart';

class Pessoa {
  int id;
  String email;
  String senha;
  PessoaFisica pessoa;

  Pessoa(String email, String senha);
}
