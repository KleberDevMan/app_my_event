// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventoStore on _EventoStoreBase, Store {
  final _$eventoAtom = Atom(name: '_EventoStoreBase.evento');

  @override
  EventoModel get evento {
    _$eventoAtom.reportRead();
    return super.evento;
  }

  @override
  set evento(EventoModel value) {
    _$eventoAtom.reportWrite(value, super.evento, () {
      super.evento = value;
    });
  }

  final _$dadosAtom = Atom(name: '_EventoStoreBase.dados');

  @override
  Map<String, dynamic> get dados {
    _$dadosAtom.reportRead();
    return super.dados;
  }

  @override
  set dados(Map<String, dynamic> value) {
    _$dadosAtom.reportWrite(value, super.dados, () {
      super.dados = value;
    });
  }

  final _$desejaInscreverSeAtom =
      Atom(name: '_EventoStoreBase.desejaInscreverSe');

  @override
  bool get desejaInscreverSe {
    _$desejaInscreverSeAtom.reportRead();
    return super.desejaInscreverSe;
  }

  @override
  set desejaInscreverSe(bool value) {
    _$desejaInscreverSeAtom.reportWrite(value, super.desejaInscreverSe, () {
      super.desejaInscreverSe = value;
    });
  }

  final _$_EventoStoreBaseActionController =
      ActionController(name: '_EventoStoreBase');

  @override
  bool inscritoNoEventoAtual(String user_id) {
    final _$actionInfo = _$_EventoStoreBaseActionController.startAction(
        name: '_EventoStoreBase.inscritoNoEventoAtual');
    try {
      return super.inscritoNoEventoAtual(user_id);
    } finally {
      _$_EventoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEvento(EventoModel value) {
    final _$actionInfo = _$_EventoStoreBaseActionController.startAction(
        name: '_EventoStoreBase.setEvento');
    try {
      return super.setEvento(value);
    } finally {
      _$_EventoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setArquivoDados(Map<String, dynamic> value) {
    final _$actionInfo = _$_EventoStoreBaseActionController.startAction(
        name: '_EventoStoreBase.setArquivoDados');
    try {
      return super.setArquivoDados(value);
    } finally {
      _$_EventoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDesejaInscreverSe(bool value) {
    final _$actionInfo = _$_EventoStoreBaseActionController.startAction(
        name: '_EventoStoreBase.setDesejaInscreverSe');
    try {
      return super.setDesejaInscreverSe(value);
    } finally {
      _$_EventoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
evento: ${evento},
dados: ${dados},
desejaInscreverSe: ${desejaInscreverSe}
    ''';
  }
}
