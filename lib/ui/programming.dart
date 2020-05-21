import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:my_event/controllersOld/eventoController.dart';

import 'package:my_event/controllersOld/programmingController.dart';

// Requisições HTTP para localhost:
// Use 10.0.2.2para AVD padrão e 10.0.3.2para genymotion
const url = 'http://10.0.2.2:3000';
const url_production = "https://tranquil-earth-03232.herokuapp.com";
const url_programming =
    url_production + "/users_backoffice/eventos/programacao?id=";

Future<Map> _buscarProgramacao(int id) async {
  try {
    http.Response response = await http.get(url_programming + "$id");
    return json.decode(response.body);
  } catch (e) {
    print(e);
    return null;
  }
}

class PageProgramming extends StatefulWidget {
  @override
  _PageProgrammingState createState() => _PageProgrammingState();
}

class _PageProgrammingState extends State<PageProgramming> {
  int _indexDias = 0;
  List<dynamic> _dias = [];
  bool nextDiaIsValid = true;

  final programmingController = ProgrammingController();
  final eventoController = GetIt.instance<EventoController>();

  _lastDia() {
    setState(() {
      programmingController.lastDia();
      _indexDias--;
    });
  }

  _nextDia() {
    setState(() {
      programmingController.nextDia();
      _indexDias++;
    });
  }

  _cardAtividade(BuildContext context, Map atividade, String data) {
    return GestureDetector(
        child: Container(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 5,
              margin: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(data, style: TextStyle(fontSize: 18)),
                    ),
                  ]),
                  Row(children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(atividade['hora'],
                          style: TextStyle(fontSize: 18)),
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(atividade['titulo'],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(atividade['descricao'],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18)),
                  Row(children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Flexible(
                      child: Container(
                        padding: new EdgeInsets.only(left: 10),
                        child: new Text(
                          atividade['local'],
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            )),
        onTap: () {
          // _showDialog(context);
          _showTestDialog(context, atividade, data);
        });
  }

  _panelData() {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            FlatButton(
              onPressed: _indexDias > 0 ? () => _lastDia() : null,
              child: Text(
                "<",
              ),
            ),
            Expanded(
                child: Text(
              programmingController.dias[programmingController.indexDias],
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )),
            FlatButton(
              onPressed:
                  _dias.length > (_indexDias + 1) ? () => _nextDia() : null,
              child: Text(
                ">",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTestDialog(BuildContext context, Map atividade, String data) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //context: _scaffoldKey.currentContext,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(top: 10, left: 25, right: 25),
            // title: Center(child: Text("Information")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              height: 500,
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(data, style: TextStyle(fontSize: 18)),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(atividade['hora'],
                            style: TextStyle(fontSize: 18)),
                      )
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Text(atividade['titulo'],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(atividade['descricao'],
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      Flexible(
                        child: Container(
                          padding: new EdgeInsets.only(left: 10),
                          child: new Text(
                            atividade['local'],
                            // overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: RaisedButton(
                      child: new Text(
                        'Fechar',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xFF121A21),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        //saveIssue();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 70.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: RaisedButton(
                        child: new Text(
                          'Inscrever-se',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue[800],
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.02,
                  // ),
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: <Widget>[
            Expanded(
                child: FutureBuilder<Map>(
                    future:
                        _buscarProgramacao(eventoController.eventoData['id']),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          if (snapshot.hasError || snapshot.data == null)
                            return Center(
                                child: Text(
                              "Erro ao Carregar Dados :(",
                              style: TextStyle(
                                  color: Colors.amber, fontSize: 25.0),
                              textAlign: TextAlign.center,
                            ));
                          else
                            // Atualiza a lista de dias
                            _dias = (snapshot.data['dias']
                                .map((d) => d['data'])
                                .toList());
                          programmingController.setDias(snapshot.data['dias']
                              .map((d) => d['data'])
                              .toList());

                          return SingleChildScrollView(
                            padding: EdgeInsets.all(5.0),
                            child: Column(children: <Widget>[
                              Observer(builder: (_) {
                                return _panelData();
                              }),
                              for (var atv in snapshot.data['dias'][_indexDias]
                                  ['atividades'])
                                _cardAtividade(context, atv, _dias[_indexDias]),
                            ]),
                          );
                      }
                    }))
          ],
        );
      },
    );
  }
}
