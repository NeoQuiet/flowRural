import 'package:flutter/material.dart';
import '../models/anuncio.dart';
class Proposta with ChangeNotifier{

final String id;
final Anuncio anuncioId;
final String qtde;
final String valor;
final bool status = false;

  Proposta({this.id, this.anuncioId, this.qtde, this.valor,});
  
}