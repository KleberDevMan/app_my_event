// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pageControllerMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PageControllerMobx on _PageControllerMobxBase, Store {
  final _$indexPageAtom = Atom(name: '_PageControllerMobxBase.indexPage');

  @override
  int get indexPage {
    _$indexPageAtom.reportRead();
    return super.indexPage;
  }

  @override
  set indexPage(int value) {
    _$indexPageAtom.reportWrite(value, super.indexPage, () {
      super.indexPage = value;
    });
  }

  final _$_PageControllerMobxBaseActionController =
      ActionController(name: '_PageControllerMobxBase');

  @override
  dynamic setIndexPage(int value) {
    final _$actionInfo = _$_PageControllerMobxBaseActionController.startAction(
        name: '_PageControllerMobxBase.setIndexPage');
    try {
      return super.setIndexPage(value);
    } finally {
      _$_PageControllerMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexPage: ${indexPage}
    ''';
  }
}
