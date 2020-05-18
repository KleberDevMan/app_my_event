import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:my_event/controllers/eventoController.dart';

import 'package:my_event/controllers/programmingController.dart';

// Requisições HTTP para localhost:
// Use 10.0.2.2para AVD padrão e 10.0.3.2para genymotion
const url = 'http://10.0.2.2:3000';
const url_programming =
    "http://10.0.2.2:3000/users_backoffice/eventos/programacao?id=";

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

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Alert Dialog title"),
          content: Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          // popup informations activity
          _showDialog(context);
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
