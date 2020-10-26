import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/endereco.dart';
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

  //instancia para ter acesso aos valores dos formularios
  final _formulario = GlobalKey<FormState>();
  final _formularioEnd = GlobalKey<FormState>();
  final _formularioUser = GlobalKey<FormState>();
  //fomrulardariotdata
  final _formularioDados = Map<String, Object>();
  final _formularioDadosEnd = Map<String, Object>();
  final _formularioDadosUser = GlobalKey<FormState>();
  //metodo que permite salvar os dados de um formulario
  void _salvarFormularioPessoa() {
    _formulario.currentState.save();

    //instância de um novo anuncio com os dados do formulario
    final novaPessoa = Pessoa(
      imagem: _formularioDados['imagem'],
      nome: _formularioDados['nome'],
      sobrenome: _formularioDados['sobrenome'],
      idEndereco: _formularioDadosEnd['idEndereco'],
      telefone2: _formularioDados['telefone2'],
      cpfcpnj: _formularioDados['cpfcnpj'],
      telefone: _formularioDados['telefone'],
    );

    //antes de salvar os dados dos formularios em um novo anuncio é executada uma função
    //que valida os campos antes de salvar

    //só é possivel uasar o provider fora da arvore de widget se o listener estiver desativado:false
    Provider.of<Pessoas>(context, listen: false)
        .adicionarPessoaEndereco(novaPessoa);
  }

  void _salvarFormularioEndereco() {
    //instância de um novo anuncio com os dados do formulario

    final novoEndereco = Endereco(
      logradouro: _formularioDadosEnd['logradouro'],
      cidade: _formularioDadosEnd['cidade'],
      estado: _formularioDadosEnd['estado'],
    );
    //antes de salvar os dados dos formularios em um novo anuncio é executada uma função
    //que valida os campos antes de salvar

    //só é possivel uasar o provider fora da arvore de widget se o listener estiver desativado:false
    Provider.of<Pessoas>(context, listen: false)
        .adicionarEndereco(novoEndereco);
  }

  void _salvarUsuarioPessoa() {
    //instância de um novo anuncio com os dados do formulario

    final usuarioPessoa = UsuarioPessoa();
    //antes de salvar os dados dos formularios em um novo anuncio é executada uma função
    //que valida os campos antes de salvar

    //só é possivel uasar o provider fora da arvore de widget se o listener estiver desativado:false
    Provider.of<Pessoas>(context, listen: false)
        .adicionarUsuarioPessoa(usuarioPessoa);
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
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _salvarFormularioPessoa();
                _salvarFormularioEndereco();
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
                hintText: 'IMAGEM (OPCIONAL)',
              ),
              //maximo de linhas
              maxLines: 1,
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'descricao', permite mudar para a proxima linha
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['imagem'] = valor,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'NOME',
              ),
              //maximo de linhas
              maxLines: 1,
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'descricao', permite mudar para a proxima linha
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['nome'] = valor,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'SOBRENOME',
              ),
              //maximo de linhas
              maxLines: 1,
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'descricao', permite mudar para a proxima linha
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['sobrenome'] = valor,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'CPF/CNPJ',
              ),
              //maximo de linhas
              maxLines: 1,
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'descricao', permite mudar para a proxima linha
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['cpfcnpj'] = valor,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'LOGRADOURO',
              ),
              //maximo de linhas
              maxLines: 1,
              //define o foco da linha

              keyboardType: TextInputType.multiline,

              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'quantidade', permite mudar para a proxima linha
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDadosEnd['logradouro'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'CIDADE',
              ),
              //maximo de linhas
              maxLines: 1,
              //define o foco da linha

              keyboardType: TextInputType.multiline,

              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'quantidade', permite mudar para a proxima linha
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDadosEnd['cidade'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'ESTADO',
              ),
              //maximo de linhas
              maxLines: 1,
              //define o foco da linha

              keyboardType: TextInputType.multiline,

              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'quantidade', permite mudar para a proxima linha
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDadosEnd['estado'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'TELEFONE PRINCIPAL',
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
              onSaved: (valor) => _formularioDados['telefone'] = valor,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'TELEFONE (OPCIONAL)',
              ),
              //maximo de linhas
              maxLines: 1,
              onFieldSubmitted: (_) {
                //Esta associado ao foco da proxima linha 'descricao', permite mudar para a proxima linha
              },
              //comando que permite salvar os formularios
              onSaved: (valor) => _formularioDados['telefone2'] = valor,
              //adiciona o botão para pular de linha
              textInputAction: TextInputAction.next,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 10,
                ),
                child: RaisedButton(
                  onPressed: () {
                    _salvarFormularioPessoa();
                    _salvarFormularioEndereco();
                    _salvarUsuarioPessoa();
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
