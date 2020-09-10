import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/provider/autenticacao_provider.dart';
import 'package:ruralflow/provider/pessoa_provider.dart';
import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/view/anuncios_view.dart';
import 'package:ruralflow/view/autenticacao_view.dart';
import 'package:ruralflow/view/expedicao_view.dart';
import 'package:ruralflow/view/flowrural_home_view.dart';
import 'package:ruralflow/view/fluxo_view.dart';
import 'package:ruralflow/widgets/form_cad_anuncio_widget.dart';
import 'package:ruralflow/widgets/form_cad_oferta.dart';
import 'package:ruralflow/widgets/form_cad_pessoa_widget.dart';
import './view/detalhe_anuncio_view.dart';
import './view/abates_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Anuncios(),
        ),
        ChangeNotifierProvider(
          create: (_) => Pessoas(),
        ),ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AutenticacaoView(),
        routes: {
          RotasFlowRural.LOGIN: (ctx) => AutenticacaoView(),
          RotasFlowRural.HOME: (ctx) => HomeFlowRural(),
          RotasFlowRural.ANUNCIO_DETALHE: (ctx) => DetalheAnuncioView(),
          RotasFlowRural.ANUNCIO_GERENCIA: (ctx) => AnuncioView(),
          RotasFlowRural.ABATES_VIEW: (ctx) => AbatesView(),
          RotasFlowRural.FLUXO_VIEW: (ctx) => FluxoView(),
          RotasFlowRural.EXPEDICAO_VIEW: (ctx) => ExpedicaoView(),
          RotasFlowRural.FORM_CAD_ANUNCIO: (ctx) => CadAnuncioForm(),
          RotasFlowRural.FORM_CAD_PESSOA: (ctx) => CadPessoaForm(),
          RotasFlowRural.FORM_CAD_OFERTA: (ctx) => CadOfertaForm(),
          
        },
      ),
    );
  }
}
