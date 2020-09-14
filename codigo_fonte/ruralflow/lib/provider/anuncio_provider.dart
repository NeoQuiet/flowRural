import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ruralflow/models/anuncio.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ruralflow/utils/constante.dart';

/* esta classe contem todos os metodos de Anuncio */
class Anuncios with ChangeNotifier {
  String _token;
  String _userId;
  //instancia que aponta para a coleção no banco
  final String _baseUrl = '${Constants.API_URL}/anuncios';
  //cria lista contendo todos os anuncios sem provedor
  List<Anuncio> _todosAnuncios = [];

  Anuncios([this._token, this._userId, this._todosAnuncios = const []]);
  //função que retorna os dados da lista de anuncios
  List<Anuncio> get todosAnuncios => [..._todosAnuncios];
  //metodo reponsavel por pegar tamanho dos anuncios
  int get totalAnuncios {
    return _todosAnuncios.length;
  }

  //metodo responsavel por adicionar um novo anuncio na lista de anuncios
  void adicionarAnuncioLista(Anuncio pNovoAnuncio) {
    _todosAnuncios.add(Anuncio(
      id: Random().nextDouble().toString(),
      anuncio: pNovoAnuncio.anuncio,
      qtde: pNovoAnuncio.qtde,
      valor: pNovoAnuncio.valor,
    ));

    notifyListeners();
  }

  Future<void> adicionarAnuncioBancoLista(Anuncio pNovoAnuncio) async {
    final response = await http.post(
      "$_baseUrl.json?auth=$_token",
      body: json.encode({
        'anuncio': pNovoAnuncio.anuncio,
        'valor': pNovoAnuncio.valor,
        'quantidade': pNovoAnuncio.qtde,
      }),
    );
    _todosAnuncios.add(Anuncio(
      id: json.decode(response.body)['name'],
      anuncio: pNovoAnuncio.anuncio,
      qtde: pNovoAnuncio.qtde,
      valor: pNovoAnuncio.valor,
    ));

    notifyListeners();
  }

  Future<void> loadProducts() async {
    final response = await http.get("$_baseUrl.json?auth=$_token");
    Map<String, dynamic> data = json.decode(response.body);

    _todosAnuncios.clear();
    if (data != null) {
      data.forEach((anuncioId, anuncioDados) {
        _todosAnuncios.add(Anuncio(
          id: anuncioId,
          anuncio: anuncioDados['anuncio'],
          valor: anuncioDados['valor'],
        ));
      });
      notifyListeners();
    }
    return Future.value();
  }
}
