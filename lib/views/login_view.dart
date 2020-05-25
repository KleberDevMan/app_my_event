import 'package:flutter/material.dart';
import 'package:my_event/repositories/user_repository.dart';
import 'package:my_event/views/cadastro_view.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'CRIAR CONTA',
              style: TextStyle(fontSize: 15),
            ),
            // textColor: C,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CadastroView()));
            },
          )
        ],
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
                controller: _emailController,
                decoration: InputDecoration(hintText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text.isEmpty || !text.contains('@'))
                    return 'E-mail inválido!';
                },
              ),
              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(hintText: 'Senha '),
                obscureText: true,
                validator: (text) {
                  if (text.isEmpty || text.length < 6) return 'Senha inválida!';
                },
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      if (_emailController.text.isEmpty) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Insira seu email para recuperação!',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold)),
                          backgroundColor: Colors.redAccent,
                          duration: Duration(seconds: 2),
                        ));
                      } else {
                        model.recoverPass(_emailController.text);
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Confira seu email!',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold)),
                          backgroundColor: Colors.green[500],
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    child: Text(
                      'Esqueci minha senha',
                      textAlign: TextAlign.right,
                    ),
                    padding: EdgeInsets.zero,
                  )),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 44,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      model.signIn(
                          email: _emailController.text,
                          senha: _senhaController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail);
                    }
                  },
                  child: Text('Entrar', style: TextStyle(fontSize: 18)),
                  color: Colors.green[800],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Falha ao entrar!',
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
