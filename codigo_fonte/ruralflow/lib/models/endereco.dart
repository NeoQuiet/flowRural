import 'package:flutter/cupertino.dart';
import 'package:ruralflow/provider/auth.dart';

class Endereco with ChangeNotifier {
  final String idEnd;
  final String logradouro;
  final String cidade;
  final String estado;

  Endereco({
    this.idEnd,
    this.logradouro,
    this.cidade,
    this.estado,
  });
}
