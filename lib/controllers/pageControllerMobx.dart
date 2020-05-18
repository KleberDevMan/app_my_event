import 'package:mobx/mobx.dart';
part 'pageControllerMobx.g.dart';

class PageControllerMobx = _PageControllerMobxBase with _$PageControllerMobx;

abstract class _PageControllerMobxBase with Store {
  @observable
  int indexPage = 0;

  @action
  setIndexPage(int value) {
    indexPage = value;
  }
}
