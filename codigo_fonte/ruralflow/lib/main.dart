import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/provider/auth.dart';
import 'package:ruralflow/provider/pessoa_provider.dart';
import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/view/abates_view.dart';
import 'package:ruralflow/view/anuncios_view.dart';
import 'package:ruralflow/view/autenticacao_home_view.dart';
import 'package:ruralflow/view/busca_view.dart';

import 'package:ruralflow/view/detalhe_anuncio_view.dart';
import 'package:ruralflow/view/expedicao_view.dart';
import 'package:ruralflow/view/flowrural_home_view.dart';
import 'package:ruralflow/view/fluxo_view.dart';

import 'package:ruralflow/widgets/form_cad_anuncio.dart';
import 'package:ruralflow/widgets/form_cad_oferta.dart';
import 'package:ruralflow/widgets/form_cad_pessoa_widget.dart';
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
        ChangeNotifierProxyProvider<Auth, Anuncios>(
          create: (_) => new Anuncios(),
          update: (ctx, auth, previousProducts) => new Anuncios(
            auth.token,
            auth.userId,
            previousProducts.todosAnuncios,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Pessoas>(
          create: (_) => new Pessoas(),
          update: (ctx, auth, previousPessoas) => new Pessoas(
            auth.token,
            auth.userId,
            previousPessoas.todasPessoas,
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeFlowRural(),
        routes: {
          RotasFlowRural.AUTENTICACAO_HOME: (ctx) => AuthOrHomeScreen(),
          RotasFlowRural.BUSCAR: (ctx) => BuscaView(),
          RotasFlowRural.HOME: (ctx) => HomeFlowRural(),
          RotasFlowRural.ANUNCIO_DETALHE: (ctx) => DetalheAnuncioView(),
          RotasFlowRural.ANUNCIO_GERENCIA: (ctx) => AnuncioView(),
          RotasFlowRural.ABATES_VIEW: (ctx) => AbatesView(),
          RotasFlowRural.FLUXO_VIEW: (ctx) => FluxoView(),
          RotasFlowRural.EXPEDICAO_VIEW: (ctx) => ExpedicaoView(),
          RotasFlowRural.FORM_CAD_ANUNCIO: (ctx) => CadAnuncioForm(),
          RotasFlowRural.FORM_CAD_PESSOA: (ctx) => CadPessoaForm(),
          RotasFlowRural.FORM_CAD_OFERTA: (ctx) => CadOfertaForm(),
          RotasFlowRural.PESSO_CAD_VIEW: (ctx) => CadPessoaView(),
        },
      ),
    );
  }
}
