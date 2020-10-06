import 'package:flutter/material.dart';

class Pessoa with ChangeNotifier {
  final String id;
  final String nome;
  final String telefone;
  final String endereco;
  final String email;
  final String senha;

  Pessoa({
    this.id,
    this.email,
    this.nome,
    this.telefone,
    this.endereco,
    this.senha,
  });
}
