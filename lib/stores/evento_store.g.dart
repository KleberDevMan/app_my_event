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

  final _$_EventoStoreBaseActionController =
      ActionController(name: '_EventoStoreBase');

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
  String toString() {
    return '''
evento: ${evento}
    ''';
  }
}
