import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ruralflow/models/item.dart';
import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:ruralflow/provider/item.dart';
import 'package:ruralflow/widgets/homeBody.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE WIDGET É O FORMULÁRIO DE CADASTRO DE SERVIÇO

*/

class CadItemForm extends StatefulWidget {
  @override
  _CadItemFormState createState() => _CadItemFormState();
}

class _CadItemFormState extends State<CadItemForm> {
  //Definir o foco de um formulario

  ///Controladores textField tipoAnuncio
  final _tipoAnuncioControlador = TextEditingController();
  Pessoa idPessoa;
  //instancia para ter acesso aos valores dos formularios
  final _formulario = GlobalKey<FormState>();
  //fomrulardariotdata
  final _formularioDados = Map<String, Object>();

  //metodo que permite salvar os dados de um formulario
  void _salvarFormulario() {
    _formulario.currentState.save();

    //instância de um novo anuncio com os dados do formulario
    final novoItem = Item(
        id: _formularioDados['id'],
        descricao: _formularioDados['descricao'],
        valor: _formularioDados['valor'],
        quantidade: _formularioDados['quantidade'],
        imagem: _formularioDados['imagem'],
        ativo: _formularioDados['ativo'],
        dtCadastro: _formularioDados['dtCadastro']);

    //antes de salvar os dados dos formularios em um novo anuncio é executada uma função
    //que valida os campos antes de salvar

    //só é possivel uasar o provider fora da arvore de widget se o listener estiver desativado:false
    Provider.of<ItemProvider>(context, listen: false)
        .adicionarItemBanco(novoItem);
    Navigator.of(context).pop();
  }

  //evitar limite de uso de memoria
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOVO ANUNCIO'),
      ),
      body: Form(
        key: _formulario,
        child: ListView(
          children: [
            _campoDescricao(),
            _textFormFieldQuantidade(),
            _textFormFieldValor(),
            Divider(),
            _campoImagem(),
            _campoAnuncioAtivo(),
            _campoDtCadastro(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                child: RaisedButton(
                  onPressed: () {
                    _salvarFormulario();
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

  _campoImagem() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Imagens ',
      ),
      //maximo de linhas
      maxLines: 1,

      //comand que permite salvar os formularios
      onSaved: (valor) => _formularioDados['imagem'] = valor,
      //adiciona o botão para pular de linha
      textInputAction: TextInputAction.next,
    );
  }

  _textFormFieldValor() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Valor ',
      ),
      //maximo de linhas
      maxLines: 1,

      //comand que permite salvar os formularios
      onSaved: (valor) => _formularioDados['valor'] = valor,
      //adiciona o botão para pular de linha
      textInputAction: TextInputAction.next,
    );
  }

  _campoAnuncioAtivo() {
    return DropdownSearch<String>(
      mode: Mode.MENU,
      showSelectedItem: true,
      items: [
        'Compra',
        'Venda',
        'Serviço',
        'Aluguel',
      ],
      hint: 'Tipo',
      onSaved: (valor) => _formularioDados['ativo'] = valor,
      autoFocusSearchBox: true,
    );
  }

  _textFormFieldQuantidade() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Quantidade',
      ),
      //define o foco da linha

      //adiciona o botão para pular de linha
      textInputAction: TextInputAction.next,
      //adiciona o teclado numerico
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
      ),
      onFieldSubmitted: (_) {
        //Esta associado ao foco da proxima linha 'valor', permite mudar para a proxima linha
      },
      //comando que permite salvar os formularios
      onSaved: (valor) => _formularioDados['quantidade'] = valor,
    );
  }

  _campoDescricao() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Descrição ',
      ),
      //maximo de linhas
      maxLines: 1,
      //comand que permite salvar os formularios

      //adiciona o botão para pular de linha
      textInputAction: TextInputAction.next,
      onSaved: (valor) => _formularioDados['descricao'] = valor,
    );
  }

  _campoDtCadastro() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Data Cadastro ',
      ),
      //maximo de linhas
      maxLines: 1,
      //comand que permite salvar os formularios

      //adiciona o botão para pular de linha
      textInputAction: TextInputAction.next,
      onSaved: (valor) => _formularioDados['dtCadastro'] = valor,
    );
  }
}
