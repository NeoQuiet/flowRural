import 'package:ruralflow/models/cidade.dart';
import 'package:ruralflow/models/fisica_pessoa.dart';
import 'package:ruralflow/models/juridica_pessoa.dart';

class Endereco {
  int id;
  PessoaFisica pessoaFisica;
  PessoaJuridica pessoaJuridica;
  String rua;
  String bairro;
  int numLocal;
  Cidade cidade;
}
