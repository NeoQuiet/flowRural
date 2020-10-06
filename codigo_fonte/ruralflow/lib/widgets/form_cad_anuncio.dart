import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/anuncio.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

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
  //Definir o foco de um formulario
  final _descricaoFocusNode = FocusNode();
  final _quantidadeFocusNode = FocusNode();
  final _valorFocusNode = FocusNode();

  List<String> _listaTipoAnuncio = [
    "Compra",
    'Venda',
    'Serviço',
  ];

  ///Controladores textField tipoAnuncio
  final _tipoAnuncioControlador = TextEditingController();

  //instancia para ter acesso aos valores dos formularios
  final _formulario = GlobalKey<FormState>();
  //fomrulardariotdata
  final _formularioDados = Map<String, Object>();

  //metodo que permite salvar os dados de um formulario
  void _salvarFormulario() {
    _formulario.currentState.save();

    //instância de um novo anuncio com os dados do formulario
    final novoAnuncio = Anuncio(
      descricao: _formularioDados['descricao'],
      anuncio: _formularioDados['tipoAnuncio'],
      qtde: _formularioDados['quantidade'],
      valor: _formularioDados['valor'],
    );

    //antes de salvar os dados dos formularios em um novo anuncio é executada uma função
    //que valida os campos antes de salvar

    //só é possivel uasar o provider fora da arvore de widget se o listener estiver desativado:false
    Provider.of<Anuncios>(context, listen: false)
        .adicionarAnuncioLista(novoAnuncio);
    Navigator.of(context).pop();
  }

  //evitar limite de uso de memoria
  @override
  void dispose() {
    super.dispose();

    _quantidadeFocusNode.dispose();
    _valorFocusNode.dispose();
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
            _campoTipoAnuncio(),
            Divider(),
            _campoTextoDescricao(),
            Divider(),
            _textFormFieldValor(),
            _textFormFieldQuantidade(),
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

  _campoTipoAnuncio() {
    return DropdownSearch<String>(
      mode: Mode.MENU,
      showSelectedItem: true,
      items: [
        'Compra',
        'Venda',
        'Serviço',
      ],
      hint: 'Tipo do Anuncio',
      onSaved: (valor) => _formularioDados['tipoAnuncio'] = valor,
      autoFocusSearchBox: true,
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

  _textFormFieldQuantidade() {
    return TextFormField(
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
    );
  }
}

_campoTextoDescricao() {
  return TextFormField(
    decoration: const InputDecoration(
      hintText: 'Descrição do anuncio ',
    ),
    //maximo de linhas
    maxLines: 5,
    //comand que permite salvar os formularios

    //adiciona o botão para pular de linha
    textInputAction: TextInputAction.next,
  );
}
