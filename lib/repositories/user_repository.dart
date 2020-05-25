import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_event/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class UserRepository extends Model {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser firebaseUser;
  // UserModel userData;
  Map<String, dynamic> userData = Map();

  bool isLoading = false;

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
  void recoverPass() {}

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
}
