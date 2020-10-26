import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ruralflow/exceptions/autenticacao_exceptions.dart';
import 'package:ruralflow/models/autenticacao.dart';
import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/utils/constante.dart';

import 'package:ruralflow/utils/store.dart';

class Auth with ChangeNotifier {
  String _userId;
  String _token;

  List<Autenticacao> _todosAuth = [];
//função que retorna os dados da lista de anuncios
  List<Autenticacao> get todasAuths => [..._todosAuth];
  final String _baseUrlAuth = '${Constants.API_URL}/usuario';

//metodo reponsavel por pegar tamanho dos anuncios
  int get totalAuth {
    return _todosAuth.length;
  }

  bool get isAuth {
    return token != null;
  }

  String get userId {
    return _userId;
  }

  String get token {
    return _token;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyC0MK6F5wZs4c5HJyL3_bRQ4L5SVtVqPGE';

    final response = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final responseBody = json.decode(response.body);
    if (responseBody["error"] != null) {
      throw AutenticacaoException(responseBody['error']['message']);
    } else {
      _token = responseBody["idToken"];
      _userId = responseBody["localId"];

      Store.saveMap('userData', {
        "token": _token,
        "userId": _userId,
      });

      notifyListeners();
    }

    return Future.value();
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }

  void logout(context) {
    _token = null;
    _userId = null;

    Store.remove('userData');
    notifyListeners();
    Navigator.of(context).pushNamed(
      RotasFlowRural.AUTENTICACAO_HOME,
    );
  }

  Future<void> adicionarUsuarioAuth(
    Autenticacao authe,
  ) async {
    final response = await http.post(
      "$_baseUrlAuth.json?",
      body: json.encode({
        'id': _userId,
        'token': authe.token,
        'email': authe.email,
        'senha': authe.senha,
      }),
    );
  }
}
