// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventoController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventoController on _EventoControllerBase, Store {
  final _$eventoDataAtom = Atom(name: '_EventoControllerBase.eventoData');

  @override
  Map<String, dynamic> get eventoData {
    _$eventoDataAtom.reportRead();
    return super.eventoData;
  }

  @override
  set eventoData(Map<String, dynamic> value) {
    _$eventoDataAtom.reportWrite(value, super.eventoData, () {
      super.eventoData = value;
    });
  }

  final _$programacaoEventoAtom =
      Atom(name: '_EventoControllerBase.programacaoEvento');

  @override
  Map<String, dynamic> get programacaoEvento {
    _$programacaoEventoAtom.reportRead();
    return super.programacaoEvento;
  }

  @override
  set programacaoEvento(Map<String, dynamic> value) {
    _$programacaoEventoAtom.reportWrite(value, super.programacaoEvento, () {
      super.programacaoEvento = value;
    });
  }

  final _$codeIsValidAtom = Atom(name: '_EventoControllerBase.codeIsValid');

  @override
  bool get codeIsValid {
    _$codeIsValidAtom.reportRead();
    return super.codeIsValid;
  }

  @override
  set codeIsValid(bool value) {
    _$codeIsValidAtom.reportWrite(value, super.codeIsValid, () {
      super.codeIsValid = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_EventoControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$buscarEventoPorCodigoAsyncAction =
      AsyncAction('_EventoControllerBase.buscarEventoPorCodigo');

  @override
  Future buscarEventoPorCodigo(String value) {
    return _$buscarEventoPorCodigoAsyncAction
        .run(() => super.buscarEventoPorCodigo(value));
  }

  @override
  String toString() {
    return '''
eventoData: ${eventoData},
programacaoEvento: ${programacaoEvento},
codeIsValid: ${codeIsValid},
isLoading: ${isLoading}
    ''';
  }
}
