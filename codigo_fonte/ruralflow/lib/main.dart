import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/provider/auth.dart';
import 'package:ruralflow/provider/item_provider.dart';
import 'package:ruralflow/provider/pessoa_provider.dart';
import 'package:ruralflow/utils/app_routes.dart';

import 'package:ruralflow/view/itens_view.dart';
import 'package:ruralflow/view/autenticacao_home_view.dart';
import 'package:ruralflow/view/busca_view.dart';
import 'package:ruralflow/view/detalhe_item.dart';

import 'package:ruralflow/view/flowrural_home_view.dart';

import 'package:ruralflow/view/lojas_view.dart';
import 'package:ruralflow/view/notificacao_vieww.dart';
import 'package:ruralflow/view/itens_busca_view.dart';

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
        home: HomeFlowRural(),
        routes: {
          RotasFlowRural.AUTENTICACAO_HOME: (ctx) => AuthOrHomeScreen(),
          RotasFlowRural.BUSCAR: (ctx) => BuscaView(),
          RotasFlowRural.HOME: (ctx) => HomeFlowRural(),
          RotasFlowRural.NOTIFICACOES: (ctx) => NotificacaoView(),
          RotasFlowRural.ITENS_GERENCIA: (ctx) => ItensCadView(),
          RotasFlowRural.FORM_CAD_ANUNCIO: (ctx) => CadAnuncioForm(),
          RotasFlowRural.FORM_CAD_PESSOA: (ctx) => CadPessoaForm(),
          RotasFlowRural.FORM_CAD_OFERTA: (ctx) => CadOfertaForm(),
          RotasFlowRural.FORM_CAD_ITEM: (ctx) => CadItemForm(),
          RotasFlowRural.PESSO_CAD_VIEW: (ctx) => CadPessoaView(),
          RotasFlowRural.LOJAS_VIEW: (ctx) => LojasView(),
          RotasFlowRural.ITENS_VIEW: (ctx) => ItensView(),
          RotasFlowRural.DETALHE_ITEM: (ctx) => DetalheItem(),
        },
      ),
    );
  }
}
