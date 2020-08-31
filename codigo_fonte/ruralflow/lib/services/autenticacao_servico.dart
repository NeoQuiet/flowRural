import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AutenticacaoServico {
  final FirebaseAuth _autenticacaoFirebase = FirebaseAuth.instance;

  Future entrarEmailSenha({
    @required String email,
    @required String senha,
  }) async {
    try {
      var usuario = await _autenticacaoFirebase.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      return usuario != null;
    } catch (e) {
      return e.message(
        'Mother Fucker, suck my dick',
      );
    }
  }

  Future cadastrarEmailSenha({
    @required String email,
    @required String senha,
  }) async {
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
