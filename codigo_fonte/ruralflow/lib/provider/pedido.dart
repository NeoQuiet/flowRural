import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ruralflow/models/pedido.dart';
import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/utils/constante.dart';

/* esta classe contem todos os metodos de Anuncio */
class Pedidos with ChangeNotifier {
  String _token;
  String _userId;
  //instancia que aponta para a coleção no banco
  final String _baseUrl = '${Constants.API_URL}pedidos';
  Pedidos([this._token, this._userId, this._todosPedidos = const []]);
  //cria lista contendo todos os anuncios sem provedor
  List<Pedido> _todosPedidos = [];
//função que retorna os dados da lista de anuncios
  List<Pedido> get todosPedidos => [..._todosPedidos];
//metodo reponsavel por pegar tamanho dos anuncios
  int get totalPedido {
    return _todosPedidos.length;
  }

  Future<void> adicionarPedidoBancoLista(Pedido pNovoPedido) async {
    final response = await http.post(
      "$_baseUrl.json?",
      body: json.encode({
        'id': _userId,
        'idTipo': pNovoPedido.idTipo,
        'quantidade': pNovoPedido.quantidade,
        'valor': pNovoPedido.valor,
      }),
    );

    _todosPedidos.add(
      Pedido(
        id: json.decode(response.body)['id'],
        idTipo: pNovoPedido.idTipo,
        quantidade: pNovoPedido.quantidade,
        valor: pNovoPedido.valor,
      ),
    );

    notifyListeners();
  }

  Future<void> loadPedidos() async {
    final response = await http.get("$_baseUrl.json");
    Map<String, dynamic> data = json.decode(response.body);

    _todosPedidos.clear();
    if (data != null) {
      data.forEach((pessoaId, pessoaDados) {
        _todosPedidos.add(Pedido(
          id: pessoaId,
          idTipo: pessoaDados['idTipo'],
          quantidade: pessoaDados['quantidade'],
          valor: pessoaDados['valor'],
        ));
      });
      notifyListeners();
    }
    return Future.value();
  }
}
