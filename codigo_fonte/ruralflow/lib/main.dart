import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/anuncio_provider.dart';
import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/view/anuncios_view.dart';
import 'package:ruralflow/view/flowrural_home_view.dart';
import 'package:ruralflow/widgets/form_cad_anuncio_widget.dart';
import './view/detalhe_anuncio_view.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeFlowRural(),
        routes: {
          RotasFlowRural.HOME: (ctx) => HomeFlowRural(),
          RotasFlowRural.ANUNCIO_DETALHE: (ctx) => DetalheAnuncioView(),
          RotasFlowRural.ANUNCIO_GERENCIA: (ctx) => AnuncioView(),
          RotasFlowRural.FORM_CAD_ANUNCIO: (ctx) => CadAnuncioForm(),
        },
      ),
    );
  }
}
