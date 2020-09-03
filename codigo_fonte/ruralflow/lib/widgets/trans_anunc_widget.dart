import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruralflow/models/anuncio.dart';
import 'package:ruralflow/models/transacao.dart';

class TransacaoAnuncios extends StatelessWidget {
  final Anuncio anuncio;

  const TransacaoAnuncios(anuncio, {Key key, this.anuncio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(anuncio.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<Transacao>(context, listen: false).removeItem(
          anuncio.id,
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('${anuncio.valor}'),
                ),
              ),
            ),
            title: Text(anuncio.descricao),
            subtitle: Text('Total: R\$ ${anuncio.valor * anuncio.qtde}'),
            trailing: Text('${anuncio.qtde}x'),
          ),
        ),
      ),
    );
  }
}
