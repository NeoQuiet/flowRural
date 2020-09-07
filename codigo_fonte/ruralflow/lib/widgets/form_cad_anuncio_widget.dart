import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/anuncio.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE WIDGET É O FORMULÁRIO DE CADASTRO DE SERVIÇO

*/
class CadAnuncioForm extends StatefulWidget {
  @override
  _CadAnuncioFormState createState() => _CadAnuncioFormState();
}

class _CadAnuncioFormState extends State<CadAnuncioForm> {
  GlobalKey<FormState> _formularioCadastroAnuncio = GlobalKey();

  //Definir o foco de um formulario
  final _descricaoFocusNode = FocusNode();
  final _quantidadeFocusNode = FocusNode();
  final _valorFocusNode = FocusNode();
  final _pesoFocusNode = FocusNode();
  final _dateFocusNode = FocusNode();
  final _imagemFocusNode = FocusNode();

  //controler da imagem
  final _imagemController = TextEditingController();
  //instancia para ter acesso aos valores dos formularios
  final _formulario = GlobalKey<FormState>();
  //fomrulardariotdata
  final _formularioDados = Map<String, Object>();

  //metodo que permite salvar os dados de um formulario
  void _salvarFormulario() {
    //instância de um novo anuncio com os dados do formulario
    final novoAnuncio = Anuncio(
      id: Random().nextDouble().toString(),
      descricao: _formularioDados['descricao'],
      anuncio: _formularioDados['anuncio'],
      qtde: _formularioDados['quantidade'],
      peso: _formularioDados['peso'],
      valor: _formularioDados['valor'],
      dataExpiracao: _formularioDados['expiracao'],
    );
    //antes de salvar os dados dos formularios em um novo anuncio é executada uma função
    //que valida os campos antes de salvar
    var isValid = _formulario.currentState.validate();

    //se não for valido
    if (!isValid) {
      return;
    }

    _formulario.currentState.save();
    //só é possivel uasar o provider fora da arvore de widget se o listener estiver desativado:false
    Provider.of<Anuncios>(context, listen: false).adicionarAnuncio(novoAnuncio);
    Navigator.of(context).pop();
  }

//inciar estado
  @override
  void initState() {
    super.initState();
    _imagemFocusNode.addListener(_atualizarImagem);
  }

//metodo atualizar imagem
  void _atualizarImagem() {
    setState(() {});
  }

  //evitar limite de uso de memoria
  @override
  void dispose() {
    super.dispose();
    _dateFocusNode.dispose();
    _descricaoFocusNode.dispose();
    _quantidadeFocusNode.dispose();
    _valorFocusNode.dispose();
    _pesoFocusNode.dispose();
    _imagemFocusNode.removeListener(_atualizarImagem);
    _imagemFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _salvarFormulario();
              })
        ],
        title: Text('Cadastrar Anuncio'),
      ),
      body: Form(
        key: _formulario,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Anuncio',
              ),
              //maximo de linhas
              maxLines: 2,
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'descricao', permite mudar para a proxima linha
                FocusScope.of(context).requestFocus(_descricaoFocusNode);
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['anuncio'] = valor,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
              validator: (valor) {
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Descricao',
              ),
              //maximo de linhas
              maxLines: 4,
              //define o foco da linha
              focusNode: _descricaoFocusNode,
              keyboardType: TextInputType.multiline,

              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'quantidade', permite mudar para a proxima linha
                FocusScope.of(context).requestFocus(_quantidadeFocusNode);
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['descricao'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Quantidade',
              ),
              //define o foco da linha
              focusNode: _quantidadeFocusNode,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
              //adiciona o teclado numerico
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'valor', permite mudar para a proxima linha
                FocusScope.of(context).requestFocus(_valorFocusNode);
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['quantidade'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Valor UN',
              ),
              //define o foco da linha
              focusNode: _valorFocusNode,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
              //adiciona o teclado numerico
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'peso', permite mudar para a proxima linha
                FocusScope.of(context).requestFocus(_pesoFocusNode);
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['valor'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Peso',
              ),
              //define o foco da linha
              focusNode: _pesoFocusNode,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
              //adiciona o teclado numerico
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'data', permite mudar para a proxima linha
                FocusScope.of(context).requestFocus(_dateFocusNode);
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['peso'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Expiracao Data',
              ),
              //define o foco da linha
              focusNode: _dateFocusNode,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
              //adiciona o teclado de data
              keyboardType: TextInputType.datetime,
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'data', permite mudar para a proxima linha
                FocusScope.of(context).requestFocus(_imagemFocusNode);
              }, //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['expiracao'] = valor,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Imagem',
                    ),
                    //define o foco da linha
                    focusNode: _imagemFocusNode,
                    //adiciona o botão para finalizar
                    textInputAction: TextInputAction.done,
                    //adiciona o teclado ddo tipo url
                    keyboardType: TextInputType.url,
                    //controller sobre o estado da imagem
                    controller: _imagemController,
                    //botão do teclado para submeter os valores
                    onFieldSubmitted: (_) {},
                    //comando que permite salvar os formularios
                    onSaved: (valor) => _formularioDados['imagem'] = valor,
                  ),
                ),
                //adiciona o container da previa da imagem
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.only(top: 8, left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  alignment: Alignment.center,
                  //realiza um teste para saber se há imagem no anuncio cadastrado
                  child: _imagemController.text.isEmpty
                      ? Text('Imagem Indisponivel')
                      : FittedBox(
                          child: Image.network(
                            _imagemController.text,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                child: RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if

                    // the form is invalid.

                    if (_formularioCadastroAnuncio.currentState.validate()) {
                      // Process data.

                    }
                  },
                  child: Text(
                    'Cadastrar',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
