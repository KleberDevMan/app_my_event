// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'programmingController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProgrammingController on _ProgrammingControllerBase, Store {
  Computed<int> _$indexComputed;

  @override
  int get index => (_$indexComputed ??= Computed<int>(() => super.index,
          name: '_ProgrammingControllerBase.index'))
      .value;
  Computed<bool> _$nextDiaIsValidComputed;

  @override
  bool get nextDiaIsValid =>
      (_$nextDiaIsValidComputed ??= Computed<bool>(() => super.nextDiaIsValid,
              name: '_ProgrammingControllerBase.nextDiaIsValid'))
          .value;
  Computed<bool> _$lastDiaIsValidComputed;

  @override
  bool get lastDiaIsValid =>
      (_$lastDiaIsValidComputed ??= Computed<bool>(() => super.lastDiaIsValid,
              name: '_ProgrammingControllerBase.lastDiaIsValid'))
          .value;

  final _$indexDiasAtom = Atom(name: '_ProgrammingControllerBase.indexDias');

  @override
  int get indexDias {
    _$indexDiasAtom.reportRead();
    return super.indexDias;
  }

  @override
  set indexDias(int value) {
    _$indexDiasAtom.reportWrite(value, super.indexDias, () {
      super.indexDias = value;
    });
  }

  final _$diasAtom = Atom(name: '_ProgrammingControllerBase.dias');

  @override
  List<dynamic> get dias {
    _$diasAtom.reportRead();
    return super.dias;
  }

  @override
  set dias(List<dynamic> value) {
    _$diasAtom.reportWrite(value, super.dias, () {
      super.dias = value;
    });
  }

  final _$_ProgrammingControllerBaseActionController =
      ActionController(name: '_ProgrammingControllerBase');

  @override
  dynamic setDias(List<dynamic> dias_p) {
    final _$actionInfo = _$_ProgrammingControllerBaseActionController
        .startAction(name: '_ProgrammingControllerBase.setDias');
    try {
      return super.setDias(dias_p);
    } finally {
      _$_ProgrammingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic lastDia() {
    final _$actionInfo = _$_ProgrammingControllerBaseActionController
        .startAction(name: '_ProgrammingControllerBase.lastDia');
    try {
      return super.lastDia();
    } finally {
      _$_ProgrammingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nextDia() {
    final _$actionInfo = _$_ProgrammingControllerBaseActionController
        .startAction(name: '_ProgrammingControllerBase.nextDia');
    try {
      return super.nextDia();
    } finally {
      _$_ProgrammingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexDias: ${indexDias},
dias: ${dias},
index: ${index},
nextDiaIsValid: ${nextDiaIsValid},
lastDiaIsValid: ${lastDiaIsValid}
    ''';
  }
}
