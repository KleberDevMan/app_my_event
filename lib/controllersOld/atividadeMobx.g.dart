// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'atividadeMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AtividadeMobx on _AtividadeMobxBase, Store {
  final _$atividadeDataAtom = Atom(name: '_AtividadeMobxBase.atividadeData');

  @override
  Map<String, dynamic> get atividadeData {
    _$atividadeDataAtom.reportRead();
    return super.atividadeData;
  }

  @override
  set atividadeData(Map<String, dynamic> value) {
    _$atividadeDataAtom.reportWrite(value, super.atividadeData, () {
      super.atividadeData = value;
    });
  }

  final _$_AtividadeMobxBaseActionController =
      ActionController(name: '_AtividadeMobxBase');

  @override
  dynamic setAtividade(Map<String, dynamic> value) {
    final _$actionInfo = _$_AtividadeMobxBaseActionController.startAction(
        name: '_AtividadeMobxBase.setAtividade');
    try {
      return super.setAtividade(value);
    } finally {
      _$_AtividadeMobxBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
atividadeData: ${atividadeData}
    ''';
  }
}
