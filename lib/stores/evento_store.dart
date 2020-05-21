import 'package:mobx/mobx.dart';
import 'package:my_event/models/evento_model.dart';

part 'evento_store.g.dart';

class EventoStore = _EventoStoreBase with _$EventoStore;

abstract class _EventoStoreBase with Store {
  @observable
  EventoModel evento;

  @action
  setEvento(EventoModel value) {
    evento = value;
  }
}
