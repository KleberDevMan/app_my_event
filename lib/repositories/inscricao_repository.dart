import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/repositories/user_repository.dart';
import 'package:my_event/stores/evento_store.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscricaoRepository extends Model {
  UserRepository user;
  final _eventoStore = GetIt.instance<EventoStore>();

  InscricaoRepository(this.user);

  String idInscricaoEvento;

  bool isLoading = false;

  static InscricaoRepository of(BuildContext context) =>
      ScopedModel.of<InscricaoRepository>(context);

  void addInscricaoEvento(
      {@required VoidCallback onSuccess, @required VoidCallback onFail}) {
    isLoading = true;

    Firestore.instance.collection('inscricoes_evento').add({
      'evento_id': '${_eventoStore.evento.id}',
      'user_id': '${user.firebaseUser.uid}'
    }).then((doc) {
      print('inscrição realizada >> ' + '$doc');
      idInscricaoEvento = doc.documentID;
      // salva no sharedPreferences

      _savarInscricaoEventoSharedPreferences(doc.documentID);
      isLoading = false;
      onSuccess();
      notifyListeners();
    }).catchError((error) {
      print('erro ao realizar inscrição >> ' + '$error');
      onFail();

      isLoading = false;
      notifyListeners();
    });
  }

  void removeInscricaoEvento(
      {@required VoidCallback onSuccess, @required VoidCallback onFail}) {
// remove inscricao pelo id
  }

  bool inscritoNoEventoAtual() {
    isLoading = true;

    // if (idInscricaoEvento == null) {
    //   // primeiro, verifica se esta salva no sharedPreferences
    //   // depois, tentar buscar no firebase
    //   _verificaInscricaoEventoJaExiste().then((doc) {
    //     isLoading = false;
    //     return idInscricaoEvento != null;
    //   });
    // } else {
    //   isLoading = false;
    //   return true;
    // }

    isLoading = false;
    return idInscricaoEvento != null;
  }

  _verificaInscricaoEventoJaExiste() async {
    // instanciando sharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // await Future.delayed(new Duration(seconds: 3));

    print(
        'inscrição_evento sharedPreferences >> ${prefs.getString('inscricao_evento_${_eventoStore.evento.id}')}');
    this.idInscricaoEvento =
        prefs.getString('inscricao_evento_${_eventoStore.evento.id}') ?? '';

    if (this.idInscricaoEvento.isEmpty) {
      //   Firestore.instance
      //       .collection('inscricoes_evento')
      //       .where("event_id", isEqualTo: "${_eventoStore.evento.id}")
      //       .where("user_id", isEqualTo: "${user.firebaseUser.uid}")
      //       .snapshots()
      //       .listen((data) => data.documents.forEach((doc) => print(doc)));
      print('>> bucando inscricao evento no firestore...');
    }
  }

  _savarInscricaoEventoSharedPreferences(String inscricao_id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'inscricao_evento_${_eventoStore.evento.id}', inscricao_id);
    print(
        'inscricao_evento_${_eventoStore.evento.id} setada >> inscricao_evento_${_eventoStore.evento.id}');
  }
}
