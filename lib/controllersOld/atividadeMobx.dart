import 'package:mobx/mobx.dart';

part 'atividadeMobx.g.dart';

class AtividadeMobx = _AtividadeMobxBase with _$AtividadeMobx;

abstract class _AtividadeMobxBase with Store {
  
  @observable
  Map<String, dynamic> atividadeData = null;

  @action
  setAtividade(Map<String, dynamic> value) {
    atividadeData = value;
  }

}