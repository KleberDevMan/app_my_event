import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/models/user_model.dart';
import 'package:my_event/repositories/inscricao_repository.dart';
import 'package:my_event/stores/evento_store.dart';
import 'package:scoped_model/scoped_model.dart';

import 'arquivo_dados_repository.dart';

class UserRepository extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;

  final _eventoStore = GetIt.instance<EventoStore>();
  final _arquivoDadosRepository = new ArquivoDadosRepository();

  List _arquivo = [];
  Map<String, dynamic> _dados;

  FirebaseUser firebaseUser;
  // UserModel userData;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

  // metodo statico para acessar esse repository do jeito que ele estiver, de qualquer lugar, sem ter que instacia-lo
  // vai evitar ter que usar o scopedModelDescendent<UserRepository>
  static UserRepository of(BuildContext context) =>
      ScopedModel.of<UserRepository>(context);

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);

    _loadCurrentUser();
  }

  // inscrever-se
  // todos paramentros como opcionais {} => posso colocar paramentro em qualquer ordem
  // @required, parametro requerido
  void signUp(
      {@required Map<String, dynamic> userData,
      @required String pass,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) {
    isLoading = true;
    notifyListeners();

    _auth
        .createUserWithEmailAndPassword(
            email: userData['email'], password: pass)
        .then((value) async {
      // criou o usuario
      firebaseUser = value.user;

      // salvar no firebaseStore
      await _saveUserData(userData);

      if (_eventoStore.desejaInscreverSe &&
          !_eventoStore.inscritoNoEventoAtual(firebaseUser.uid)) {
        Firestore.instance.collection('inscricoes_evento').add({
          'evento_id': '${_eventoStore.evento.id}',
          'user_id': '${firebaseUser.uid}'
        }).then((doc) {
          print('inscrição realizada >> ' + '$doc');
          String idInscricaoEvento = doc.documentID;

          // salva no arquivo
          Map<String, dynamic> _dados = Map();
          _dados[firebaseUser.uid] = {
            "eventos": [
              {
                "evento_code": _eventoStore.evento.code,
                "evento_id": _eventoStore.evento.id,
                "inscricao_evento_id": idInscricaoEvento,
                "inscricao_atividades": [{}]
              }
            ]
          };
          print('Salvando dados no arquivo >> ${_dados.toString()}');

          // carrega arquivo no store
          // _eventoStore.setArquivoDados(_);
        }).catchError((error) {
          print('erro ao realizar inscrição >> ' + '$error');
        });

        _eventoStore.setDesejaInscreverSe(false);
      }

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      print(error);
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  // Entrar
  void signIn(
      {@required String email,
      @required String senha,
      @required VoidCallback onSuccess,
      @required VoidCallback onFail}) async {
    isLoading = true;
    notifyListeners();

    _auth
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) async {
      firebaseUser = value.user;

      await _loadCurrentUser();

      if (_eventoStore.desejaInscreverSe &&
          !_eventoStore.inscritoNoEventoAtual(firebaseUser.uid)) {
        Firestore.instance.collection('inscricoes_evento').add({
          'evento_id': '${_eventoStore.evento.id}',
          'user_id': '${firebaseUser.uid}'
        }).then((doc) {
          print('inscrição realizada >> ' + '$doc');
          String idInscricaoEvento = doc.documentID;

          // salva no arquivo
          Map<String, dynamic> _dados = Map();
          _dados[firebaseUser.uid] = {
            "eventos": [
              {
                "evento_code": _eventoStore.evento.code,
                "evento_id": _eventoStore.evento.id,
                "inscricao_evento_id": idInscricaoEvento,
                "inscricao_atividades": [{}]
              }
            ]
          };
          print('Salvando dados no arquivo >> ${_dados.toString()}');

          // carrega arquivo no store
          // _eventoStore.setArquivoDados(_);
        }).catchError((error) {
          print('erro ao realizar inscrição >> ' + '$error');
        });
      }
      _eventoStore.setDesejaInscreverSe(false);

      onSuccess();
      isLoading = false;
      notifyListeners();
    }).catchError((error) {
      onFail();
      isLoading = false;
      notifyListeners();
    });
  }

  // Recuperar senha
  void recoverPass(String email) {
    _auth.sendPasswordResetEmail(email: email);
  }

  // Está logado?
  bool isLoggedIn() {
    return firebaseUser != null;
  }

  void signOut() async {
    await _auth.signOut();

    userData = Map();
    firebaseUser = null;

    notifyListeners();
  }

  // salva os dados do user no fire store
  Future<Null> _saveUserData(Map<String, dynamic> value) async {
    this.userData = value;
    await Firestore.instance
        .collection('users')
        .document(firebaseUser.uid)
        .setData(value);
  }

  // busca os dados do usuario no banco de dados firebase
  Future<Null> _loadCurrentUser() async {
    if (firebaseUser == null) firebaseUser = await _auth.currentUser();

    if (firebaseUser != null) {
      if (userData['name'] == null) {
        DocumentSnapshot docUser = await Firestore.instance
            .collection('users')
            .document(firebaseUser.uid)
            .get();
        userData = docUser.data;
      }
    }

    notifyListeners();
  }

  void inscreverSeNoEventoAtual(
      {@required VoidCallback onSuccess, @required VoidCallback onFail}) async {
    Firestore.instance.collection('inscricoes_evento').add({
      'evento_id': '${_eventoStore.evento.id}',
      'user_id': '${firebaseUser.uid}'
    }).then((doc) {
      print('inscrição realizada >> ' + '$doc');
      String idInscricaoEvento = doc.documentID;

      // getArquivo, editArquivo e saveArquivo
      Map<String, dynamic> _dados_p = Map();
      _dados_p = {
        "eventos": [
          {
            "evento_code": _eventoStore.evento.code,
            "evento_id": _eventoStore.evento.id,
            "inscricao_evento_id": idInscricaoEvento,
            "inscricao_atividades": [{}]
          }
        ]
      };
      _salvarDadosUserNoArquivoENoEventoStore(_dados_p);
    }).catchError((error) {
      print('erro ao realizar inscrição >> ' + '$error');
    });
  }

  void _salvarDadosUserNoArquivoENoEventoStore(Map<String, dynamic> _dados_p) {
    _arquivoDadosRepository.readData().then((arquive) {
      _arquivo = json.decode(arquive);
      _dados = _arquivo != null ? _arquivo.length > 0 ? _arquivo[0] : {} : {};

      _dados[firebaseUser.uid] = _dados_p;
      _arquivo.add(_dados);
      _eventoStore.setArquivoDados(_dados);

      // salva arquivo no celular
      _arquivoDadosRepository.saveData2(_arquivo);
    });
  }
}
