import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/provider/pessoa.dart';
import 'package:ruralflow/utils/app_routes.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE WIDGET É O FORMULÁRIO DE CADASTRO DE SERVIÇO

*/
class CadPessoaForm extends StatefulWidget {
  @override
  _CadPessoaFormState createState() => _CadPessoaFormState();
}

class _CadPessoaFormState extends State<CadPessoaForm> {
  //Definir o foco de um formulario
  final _nomeFocusNode = FocusNode();
  final _enderecoFocusNode = FocusNode();
  final _telefoneFocusNode = FocusNode();

  //instancia para ter acesso aos valores dos formularios
  final _formulario = GlobalKey<FormState>();
  //fomrulardariotdata
  final _formularioDados = Map<String, Object>();

  //metodo que permite salvar os dados de um formulario
  void _salvarFormulario() {
    _formulario.currentState.save();

    //instância de um novo anuncio com os dados do formulario
    final novaPessoa = Pessoa(
      nome: _formularioDados['nome'],
      endereco: _formularioDados['endereco'],
      telefone: _formularioDados['telefone'],
      email: _formularioDados['email'],
      senha: _formularioDados['senha'],
    );
    //antes de salvar os dados dos formularios em um novo anuncio é executada uma função
    //que valida os campos antes de salvar

    //só é possivel uasar o provider fora da arvore de widget se o listener estiver desativado:false
    Provider.of<Pessoas>(context, listen: false)
        .adicionarPessoaBancoLista(novaPessoa);
  }

  //evitar limite de uso de memoria
  @override
  void dispose() {
    super.dispose();
    _nomeFocusNode.dispose();
    _enderecoFocusNode.dispose();
    _telefoneFocusNode.dispose();
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
        title: Text('Cadastro Próprio'),
      ),
      body: Form(
        key: _formulario,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nome do estabelecimento',
              ),
              //maximo de linhas
              maxLines: 1,
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'descricao', permite mudar para a proxima linha
                FocusScope.of(context).requestFocus(_enderecoFocusNode);
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['nome'] = valor,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Endereco',
              ),
              //maximo de linhas
              maxLines: 1,
              //define o foco da linha
              focusNode: _enderecoFocusNode,
              keyboardType: TextInputType.multiline,

              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'quantidade', permite mudar para a proxima linha
                FocusScope.of(context).requestFocus(_telefoneFocusNode);
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['endereco'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Telefone',
              ),
              //define o foco da linha
              focusNode: _telefoneFocusNode,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
              //adiciona o teclado numerico
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onFieldSubmitted: (_) {},
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['telefone'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              //define o foco da linha

              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
              //adiciona o teclado numerico
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onFieldSubmitted: (_) {},
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['email'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Senha',
              ),
              //define o foco da linha

              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
              //adiciona o teclado numerico
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onFieldSubmitted: (_) {},
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['senha'] = valor,
            ),
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
}
