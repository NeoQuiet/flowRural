import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AutenticacaoCtrl with ChangeNotifier {
  final FirebaseAuth _autenticacaoFirebase = FirebaseAuth.instance;

  Future<void> cadastrar(String email, String senha) async {
    try {
      var resultCadastro =
          await _autenticacaoFirebase.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return resultCadastro != null;
    } catch (e) {
      return e.message(
        'Mother Fucker, suck my dick',
      );
    }
  }
}
