import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/utils/constante.dart';

/* esta classe contem todos os metodos de Anuncio */
class Pessoas with ChangeNotifier {
  String _token;
  String _userId;
  //instancia que aponta para a coleção no banco
  final String _baseUrl = '${Constants.API_URL}/pessoa';
  Pessoas([this._token, this._userId, this._todasPessoas = const []]);
  //cria lista contendo todos os anuncios sem provedor
  List<Pessoa> _todasPessoas = [];
//função que retorna os dados da lista de anuncios
  List<Pessoa> get todasPessoas => [..._todasPessoas];
//metodo reponsavel por pegar tamanho dos anuncios
  int get totalPessoa {
    return _todasPessoas.length;
  }

  //metodo responsavel por adicionar um novo anuncio na lista de anuncios
  void adicionarPessoaLista(Pessoa pNovoPessoa) {
    _todasPessoas.add(Pessoa(
      id: Random().nextDouble().toString(),
      nome: pNovoPessoa.nome,
      endereco: pNovoPessoa.endereco,
      telefone: pNovoPessoa.telefone,
    ));

    notifyListeners();
  }

  Future<void> adicionarPessoaBancoLista(Pessoa pNovoPessoa) async {
    final response = await http.post(
      "$_baseUrl.json?",
      body: json.encode({
        'nome': pNovoPessoa.nome,
        'endereco': pNovoPessoa.endereco,
        'telefone': pNovoPessoa.telefone,
        'email': pNovoPessoa.email,
        'senha': pNovoPessoa.senha,
      }),
    );

    _todasPessoas.add(
      Pessoa(
        id: json.decode(response.body)['name'],
        nome: pNovoPessoa.nome,
        endereco: pNovoPessoa.endereco,
        telefone: pNovoPessoa.telefone,
        email: pNovoPessoa.email,
        senha: pNovoPessoa.senha,
      ),
    );

    notifyListeners();
  }

  Future<void> loadPessoas() async {
    final response = await http.get("$_baseUrl.json?auth=$_token");
    Map<String, dynamic> data = json.decode(response.body);

    _todasPessoas.clear();
    if (data != null) {
      data.forEach((pessoaId, pessoaDados) {
        _todasPessoas.add(Pessoa(
          id: pessoaId,
          nome: pessoaDados['nome'],
          endereco: pessoaDados['endereco'],
          telefone: pessoaDados['telefone'],
        ));
      });
      notifyListeners();
    }
    return Future.value();
  }
}
