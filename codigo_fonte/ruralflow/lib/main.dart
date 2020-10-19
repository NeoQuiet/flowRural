import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/provider/auth.dart';
import 'package:ruralflow/provider/item.dart';
import 'package:ruralflow/provider/pessoa.dart';
import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/view/anuncios_view.dart';

import 'package:ruralflow/view/autenticacao_home_view.dart';
import 'package:ruralflow/view/busca_view.dart';
import 'package:ruralflow/view/detalhe_item.dart';
import 'package:ruralflow/view/detalhe_pessoa.dart';

import 'package:ruralflow/view/flowrural_home_view.dart';

import 'package:ruralflow/view/lojas_view.dart';
import 'package:ruralflow/view/notificacao_vieww.dart';
import 'package:ruralflow/view/item_view.dart';
import 'package:ruralflow/view/pedido.dart';
import 'package:ruralflow/view/perfil.dart';

import 'package:ruralflow/widgets/form_cad_anuncio.dart';
import 'package:ruralflow/widgets/form_cad_itens.dart';
import 'package:ruralflow/widgets/form_cad_oferta.dart';
import 'package:ruralflow/widgets/form_cad_pessoa.dart';
import './view/cad_pessoa_View.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => new ItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Pessoas(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Anuncios(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          RotasFlowRural.BUSCAR: (ctx) => BuscaView(),
          RotasFlowRural.AUTENTICACAO_HOME: (ctx) => AuthOrHomeScreen(),
          RotasFlowRural.HOME: (ctx) => HomeFlowRural(),
          RotasFlowRural.NOTIFICACOES: (ctx) => NotificacaoView(),
          RotasFlowRural.FORM_CAD_ANUNCIO: (ctx) => CadAnuncioForm(),
          RotasFlowRural.FORM_CAD_PESSOA: (ctx) => CadPessoaForm(),
          RotasFlowRural.FORM_CAD_OFERTA: (ctx) => CadOfertaForm(),
          RotasFlowRural.FORM_CAD_ITEM: (ctx) => CadItemForm(),
          RotasFlowRural.PESSO_CAD_VIEW: (ctx) => CadPessoaView(),
          RotasFlowRural.LOJAS_VIEW: (ctx) => LojasView(),
          RotasFlowRural.PRODUTOS_VIEW: (ctx) => ProdutosView(),
          RotasFlowRural.ANUNCIO_GERENCIA: (ctx) => AnuncioView(),
          RotasFlowRural.VISUALIZAR: (ctx) => DetalheItem(),
          RotasFlowRural.VISUALIZAR_PESSOA: (ctx) => DetalhePessoa(),
          RotasFlowRural.PERFIL_PESSOA: (ctx) => PerfilPessoa(),
          RotasFlowRural.PEDIDOS: (ctx) => PedidosView(),
        },
      ),
    );
  }
}
