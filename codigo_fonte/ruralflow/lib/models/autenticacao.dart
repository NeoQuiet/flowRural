import 'package:flutter/cupertino.dart';

class Autenticacao with ChangeNotifier {
  final String id;
  final String token;
  final String email;
  final String senha;

  Autenticacao({
    this.id,
    this.token,
    this.email,
    this.senha,
  });
}
