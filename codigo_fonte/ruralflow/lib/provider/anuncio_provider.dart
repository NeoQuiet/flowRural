import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ruralflow/models/anuncio.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ruralflow/utils/contante.dart';

/* esta classe contem todos os metodos de Anuncio */
class Anuncios with ChangeNotifier {
  //instancia que aponta para a coleção no banco
  final String _baseUrl = '${Constants.ANUNCIO_API_URL}/anuncios';
  //cria lista contendo todos os anuncios sem provedor
  List<Anuncio> _todosAnuncios = [];
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
      descricao: pNovoAnuncio.descricao,
      anuncio: pNovoAnuncio.anuncio,
      qtde: pNovoAnuncio.qtde,
      peso: pNovoAnuncio.peso,
      valor: pNovoAnuncio.valor,
      dataExpiracao: pNovoAnuncio.dataExpiracao,
    ));

    notifyListeners();
  }

  Future<void> adicionarAnuncioBancoLista(Anuncio pNovoAnuncio) async {
    final response = await http.post(
      "$_baseUrl.json",
      body: json.encode({
        'anuncio': pNovoAnuncio.anuncio,
        'descricao': pNovoAnuncio.descricao,
        'valor': pNovoAnuncio.valor,
        'peso': pNovoAnuncio.peso,
        'quantidade': pNovoAnuncio.qtde,
        'data_expiracao': pNovoAnuncio.dataExpiracao,
      }),
    );
    _todosAnuncios.add(Anuncio(
      id: json.decode(response.body)['name'],
      descricao: pNovoAnuncio.descricao,
      anuncio: pNovoAnuncio.anuncio,
      qtde: pNovoAnuncio.qtde,
      peso: pNovoAnuncio.peso,
      valor: pNovoAnuncio.valor,
      dataExpiracao: pNovoAnuncio.dataExpiracao,
    ));

    notifyListeners();
  }
}