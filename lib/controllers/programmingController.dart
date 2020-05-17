import 'package:mobx/mobx.dart';

part 'programmingController.g.dart';

class ProgrammingController = _ProgrammingControllerBase
    with _$ProgrammingController;

abstract class _ProgrammingControllerBase with Store {
  @observable
  int indexDias = 0;

  @observable
  List<dynamic> dias = [];

  @computed
  int get index {
    return indexDias;
  }

  @computed
  bool get nextDiaIsValid {
    return dias.length > indexDias;
  }

  @computed
  bool get lastDiaIsValid {
    return indexDias > 0;
  }

  @action
  setDias(List<dynamic> dias_p){
    dias = dias_p;
  }

  @action
  lastDia() {
    indexDias--;
  }

  @action
  nextDia() {
    indexDias++;
  }
}
