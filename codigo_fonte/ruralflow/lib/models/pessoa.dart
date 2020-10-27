import 'package:flutter/material.dart';
import 'package:ruralflow/utils/constante.dart';

class Pessoa with ChangeNotifier {
  final String id;
  final String imagem;
  final String nome;
  final String sobrenome;
  final String cpfcpnj;
  final String telefone;
  final String telefone2;
  final String idEndereco;

  Pessoa({
    this.imagem,
    this.cpfcpnj,
    this.id,
    this.sobrenome,
    this.telefone2,
    this.nome,
    this.telefone,
    this.idEndereco,
  });
}
