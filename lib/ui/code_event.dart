import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/controllersOld/eventoController.dart';
import 'package:my_event/menu_bottom.dart';

// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

class CodeEvent extends StatefulWidget {
  @override
  _CodeEventState createState() => _CodeEventState();
}

// const url = 'http://10.0.2.2:3000';
// const url_evento = "http://10.0.2.2:3000/users_backoffice/eventos/evento?code=";

// Future<Map> getEvento(String code) async {
//   try {
//     http.Response response = await http.get(url_evento + code);
//     return json.decode(response.body);
//   } catch (error) {
//     print(error);
//     return null;
//   }
// }

class _CodeEventState extends State<CodeEvent> {
  TextEditingController codeController = TextEditingController();
  final eventoController = GetIt.instance<EventoController>();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.grey[850],
        body: eventoController.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _formKey,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(),
                    SingleChildScrollView(
                        child: Container(
                      margin: EdgeInsets.only(
                          top: 0, left: 16, bottom: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text('MY EVENT',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white70)),
                          Text('v 1.0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white70)),
                          SizedBox(
                            height: 32,
                          ),
                          Icon(
                            Icons.people_outline,
                            color: Colors.green[800],
                            size: 160,
                          ),
                          if (eventoController.codeIsValid != null &&
                              eventoController.codeIsValid == false)
                            Text('Erro ao Carregar Dados :(',
                                textAlign: TextAlign.center,
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red)),
                          Theme(
                            data: new ThemeData(
                              primaryColor: Colors.green[800],
                            ),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.green[800])),
                                  hintText: 'Código',
                                  hintStyle: TextStyle(color: Colors.white70),
                                  labelStyle:
                                      TextStyle(color: Colors.green[800]),
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.green[800], fontSize: 25.0),
                                controller: codeController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Insira um código!";
                                  }
                                }),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: Container(
                                height: 50.0,
                                child: RaisedButton(
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      eventoController
                                          .buscarEventoPorCodigo(
                                              codeController.text)
                                          .then((value) {
                                        if (eventoController.codeIsValid)
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MenuBottom()));
                                      });
                                    }
                                  },
                                  child: Text('Buscar',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25.0)),
                                  color: Colors.green[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25.0),
                                      topLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0),
                                      bottomLeft: Radius.circular(25.0),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
      );
    });
  }
}
