import 'package:mobx/mobx.dart';
import 'package:my_event/models/evento_model.dart';

part 'evento_store.g.dart';

class EventoStore = _EventoStoreBase with _$EventoStore;

abstract class _EventoStoreBase with Store {
  @observable
  EventoModel evento;

  @observable
  Map<String, dynamic> dados;

  @observable
  bool desejaInscreverSe = false;

  @action
  bool inscritoNoEventoAtual(String user_id) {
    bool resultado = false;

    if (!user_id.isEmpty && user_id != null) {
      Map<String, dynamic> dados_user = dados[user_id];

      if (dados_user != null) {
        if (dados_user['inscricao_evento_id'] != null) {
          resultado = !dados_user['inscricao_evento_id'].isEmpty;
        }
      }
    }

    return resultado;
  }

  @action
  setEvento(EventoModel value) {
    evento = value;
  }

  @action
  setArquivoDados(Map<String, dynamic> value) {
    dados = value;
  }

  @action
  setDesejaInscreverSe(bool value) {
    desejaInscreverSe = value;
  }
}
