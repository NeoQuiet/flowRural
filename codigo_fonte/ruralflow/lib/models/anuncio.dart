import 'package:flutter/foundation.dart';
/* 
  Um anuncio possui o objetivo de conseguir uma resposta a curto prazo e de al
  cançar o maior número de pessoas em uma determinada área ou região.

Um anuncio serve para aumentar as chances de se atingir um objetivo a curto, lon
go e médio prazo atingindo o maior numéro de pessoas possível.Seja uma compra ou
uma venda, muitas pessoas anunciam serviços e produtos em sua região.
As principal caracteristica de um anuncio é o seu conteúdo, com isso queremos di
zer as informações principais de um anuncio e para isso respondemos a seguinte 
pergunta: O que está sendo anunciado? Se o anuncio é confiável



 */

class Anuncio with ChangeNotifier {
  String id;
  String peso;
  String descricao;
  int qtde;
  double valor;

  bool isFavorite;

  void selecionaFavorito() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
