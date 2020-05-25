import 'package:flutter/material.dart';
import 'package:my_event/repositories/user_repository.dart';
import 'package:scoped_model/scoped_model.dart';

class CadastroView extends StatefulWidget {
  @override
  _CadstroViewState createState() => _CadstroViewState();
}

class _CadstroViewState extends State<CadastroView> {
  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Criar Conta'),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserRepository>(
            builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(hintText: 'Nome Completo'),
                  validator: (text) {
                    if (text.isEmpty) return 'Nome inválido!';
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _cpfController,
                  decoration: InputDecoration(hintText: 'CPF'),
                  validator: (text) {
                    if (text.isEmpty) return 'CPF inválido!';
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text.isEmpty || !text.contains('@'))
                      return 'E-mail inválido!';
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(hintText: 'Senha '),
                  obscureText: true,
                  validator: (text) {
                    if (text.isEmpty || text.length < 6)
                      return 'Senha inválida!';
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Map<String, dynamic> userData = {
                          'name': _nomeController.text,
                          'cpf': _cpfController.text,
                          'email': _emailController.text
                        };

                        model.signUp(
                          userData: userData,
                          pass: _senhaController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail,
                        );
                      }
                    },
                    child: Text('Criar Conta', style: TextStyle(fontSize: 18)),
                    color: Colors.green[800],
                  ),
                ),
              ],
            ),
          );
        }));
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Usuário criado com sucesso!'),
      backgroundColor: Colors.green[500],
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Falha ao criar usuário!'),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
