import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ruralflow/models/anuncio.dart';

/* esta classe contem todos os metodos de Anuncio */
class Anuncios with ChangeNotifier {
  //cria lista contendo todos os anuncios sem provedor
  List<Anuncio> _todosAnuncios = [];
//função que retorna os dados da lista de anuncios
  List<Anuncio> get todosAnuncios => [..._todosAnuncios];
//metodo reponsavel por pegar tamanho dos anuncios
  int get totalAnuncios {
    return _todosAnuncios.length;
  }

  //metodo responsavel por adicionar um novo anuncio na lista de anuncios
  void adicionarAnuncio(Anuncio pNovoAnuncio) {
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
}
