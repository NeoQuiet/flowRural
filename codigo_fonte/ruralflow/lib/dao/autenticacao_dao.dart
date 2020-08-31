import 'package:ruralflow/ctrl/autenticacao_ctrl.dart';
import 'package:ruralflow/models/pessoa.dart';

class AutenticacaoDao implements AutenticacaoCtrl {
  AutenticacaoCtrl autenticacaoCtrl;
  Pessoa pessoa;

  @override
  Future<void> cadastrar(String email, String senha) {
    pessoa = new Pessoa(
      email,
      senha,
    );
    autenticacaoCtrl.cadastrar(email, senha);
  }

  @override
  void addListener(listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }
}
