import 'package:flutter/material.dart';

class Pessoa with ChangeNotifier {
  final String id;
  final String nome;
  final String telefone;
  final String endereco;

  Pessoa({
    this.id,
    this.nome,
    this.telefone,
    this.endereco,
  });
}
