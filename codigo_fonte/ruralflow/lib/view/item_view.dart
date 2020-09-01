import 'package:flutter/material.dart';
import 'package:ruralflow/models/anuncio.dart';
import 'package:ruralflow/utils/app_routes.dart';
import 'package:ruralflow/widgets/form_cad_anuncio_widget.dart';

/*
AUTOR: CAIO RODRIGO C PEIXOTO
DATA: 30/08/2020
FUNÇÃO: ESTE ESTÁ INTERFACE TEM COMO FINALIDADE, LISTAR OS ANUNCIOS JÁ CRIADOS E 
PERMITIR QUE O USUÁRIO POSSA CRIAR, EDITAR OU INATIVAR ANUNCIOS. 
 */
class ItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Anuncio anuncio =
        ModalRoute.of(context).settings.arguments as Anuncio;
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.add,
                ),
                /* Ao selecionar o botão Adicionar
                a pagina de cadastro de anuncio será exibida
                 */
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadAnuncioForm(),
                    ),
                  );
                  // CadAnuncioForm();
                },
              )
            ],
            title: Text(
              'Gerenciar itens',
            ),
          ),
        ),
      ],
    );
  }
}
