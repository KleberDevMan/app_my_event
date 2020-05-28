import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/repositories/user_repository.dart';
import 'package:my_event/stores/evento_store.dart';
import 'package:scoped_model/scoped_model.dart';

class InscricaoRepository extends Model {
  UserRepository user;
  final _eventoStore = GetIt.instance<EventoStore>();

  InscricaoRepository(this.user);

  String idInscricaoEvento;

  static InscricaoRepository of(BuildContext context) => ScopedModel.of<InscricaoRepository>(context);

  void addInscricaoEvento() {
    Firestore.instance.collection('inscricoes_evento').add({
      'evento_id': '${_eventoStore.evento.id}',
      'user_id': '${user.firebaseUser.uid}'
    }).then((doc) {
      print(doc);
      idInscricaoEvento = 'true';
      // inscricaoEvento =
    });

    notifyListeners();
  }

  void removeInscricaoEvento() {
// remove inscricao pelo id
    
  }

  bool inscritoNoEventoAtual() {
    return idInscricaoEvento != null;
  }
}
