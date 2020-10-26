import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ruralflow/models/autenticacao.dart';
import 'package:ruralflow/models/endereco.dart';
import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/provider/auth.dart';
import 'package:ruralflow/utils/constante.dart';

/* esta classe contem todos os metodos de Anuncio */
class Pessoas with ChangeNotifier {
  String _token;
  String _userId;
  //instancia que aponta para a coleção no banco
  final String _baseUrl = '${Constants.API_URL}/pessoa';
  final String _baseUrlEnd = '${Constants.API_URL}/endereco';
  final String _baseUrlUserPessoa = '${Constants.API_URL}/usuario-pessoa';
  Pessoas([
    this._token,
    this._userId,
    this._todasPessoas = const [],
    this._todosEnderecos,
  ]);
  //cria lista contendo todos os anuncios sem provedor
  List<Pessoa> _todasPessoas = [];
  List<Endereco> _todosEnderecos = [];
//função que retorna os dados da lista de anuncios
  List<Pessoa> get todasPessoas => [..._todasPessoas];
  List<Endereco> get todosEnderecos => [..._todosEnderecos];
//metodo reponsavel por pegar tamanho dos anuncios
  int get totalPessoa {
    return _todasPessoas.length;
  }

  String pessoaId(Pessoa pessoa) {
    return pessoa.id;
  }

  int get totalEndereco {
    return _todosEnderecos.length;
  }

  //metodo responsavel por adicionar um novo anuncio na lista de anuncios

  Future<void> adicionarPessoaEndereco(
    Pessoa pNovoPessoa,
  ) async {
    final response = await http.post(
      "$_baseUrl.json?",
      body: json.encode({
        'id': Random().nextDouble(),
        'imagem': pNovoPessoa.imagem,
        'nome': pNovoPessoa.nome,
        'sobrenome': pNovoPessoa.sobrenome,
        'cpfcnpj': pNovoPessoa.cpfcpnj,
        'idEndereco': pNovoPessoa.idEndereco,
        'telefone2': pNovoPessoa.telefone2,
        'telefone': pNovoPessoa.telefone,
      }),
    );

    _todasPessoas.add(
      Pessoa(
        id: json.decode(response.body)['name'],
        nome: pNovoPessoa.nome,
        telefone2: pNovoPessoa.telefone2,
        sobrenome: pNovoPessoa.sobrenome,
        cpfcpnj: pNovoPessoa.cpfcpnj,
        telefone: pNovoPessoa.telefone,
        idEndereco: pNovoPessoa.idEndereco,
      ),
    );

    notifyListeners();
  }

  Future<void> adicionarEndereco(
    Endereco endereco,
  ) async {
    final response = await http.post(
      "$_baseUrlEnd.json?",
      body: json.encode({
        'idEnd': Random().nextDouble(),
        'logradouro': endereco.logradouro,
        'cidade': endereco.cidade,
        'estado': endereco.estado,
      }),
    );

    _todosEnderecos.add(
      Endereco(
        idEnd: json.decode(response.body)['name'],
        logradouro: endereco.logradouro,
        cidade: endereco.cidade,
        estado: endereco.estado,
      ),
    );

    notifyListeners();
  }

  Future<void> adicionarUsuarioPessoa(
    UsuarioPessoa usuarioPessoa,
  ) async {
    final response = await http.post(
      "$_baseUrlUserPessoa.json?",
      body: json.encode({
        'id': _userId,
        'idUsuario': _userId,
        'idPessoa': _userId,
        'ativo': usuarioPessoa.ativo,
        'dtCadastro': usuarioPessoa.dtCadastro,
      }),
    );
  }

  Future<void> loadPessoas() async {
    final response = await http.get("$_baseUrl.json");
    Map<String, dynamic> data = json.decode(response.body);

    _todasPessoas.clear();
    if (data != null) {
      data.forEach((pessoaId, pessoaDados) {
        _todasPessoas.add(Pessoa(
          id: pessoaId,
          nome: pessoaDados['nome'],
          idEndereco: pessoaDados['idEndereco'],
          telefone: pessoaDados['telefone'],
        ));
      });
      notifyListeners();
    }
    return Future.value();
  }
}

class UsuarioPessoa {
  String id;
  String idUsuario;
  String idPessoa;
  DateTime dtCadastro;
  String ativo;
}
