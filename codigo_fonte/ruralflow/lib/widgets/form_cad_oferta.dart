import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/pessoa.dart';
import 'package:ruralflow/provider/pessoa_provider.dart';
import 'package:ruralflow/utils/app_routes.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE WIDGET É O FORMULÁRIO DE CADASTRO DE SERVIÇO

*/
class CadOfertaForm extends StatefulWidget {
  @override
  _CadOfertaFormState createState() => _CadOfertaFormState();
}

class _CadOfertaFormState extends State<CadOfertaForm> {
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
    );
    //antes de salvar os dados dos formularios em um novo anuncio é executada uma função
    //que valida os campos antes de salvar

    //só é possivel uasar o provider fora da arvore de widget se o listener estiver desativado:false
    Provider.of<Pessoas>(context, listen: false)
        .adicionarPessoaBancoLista(novaPessoa);
    Navigator.popAndPushNamed(context, RotasFlowRural.AUTENTICACAO_HOME);
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
        actions: [],
        title: Text('Oferta'),
      ),
      body: Form(
        key: _formulario,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Valor da proposta',
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
                hintText: 'Quantidade',
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
                hintText: 'Raça',
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
                    'Realizar Proposta',
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
