import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/provider/auth.dart';
import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/view/anuncio_view.dart';
import 'package:ruralflow/view/auth_view.dart';
import 'package:ruralflow/view/flowrural_overview.dart';

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
  }
}
