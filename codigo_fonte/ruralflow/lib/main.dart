import 'package:flutter/material.dart';
import 'package:ruralflow/view/anuncio_view.dart';
import 'package:ruralflow/view/autenticacao_view.dart';
import 'package:ruralflow/view/boasVindas_view.dart';
import 'package:ruralflow/view/flowrural_home_view.dart';
import 'package:ruralflow/view/func_anuncio_view.dart';
import 'package:ruralflow/view/item_view.dart';
import 'package:ruralflow/widgets/form_cad_anuncio_widget.dart';
import 'package:ruralflow/widgets/form_cad_produto_widget.dart';
import 'package:ruralflow/widgets/form_cad_pessoa_widget.dart';
import 'package:ruralflow/widgets/form_cad_servico_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeFlowRural(),
    );
  }
}

/* 
MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
      ],
      child: MaterialApp(
        home: HomeFlowRural(),
        routes: {
          AppRotas.ANUNCIO_DESCRICAO: (ctx) => AnuncioView(),
        },
      ),
    );




 */
