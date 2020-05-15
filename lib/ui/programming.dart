import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// Requisições HTTP para localhost:
// Use 10.0.2.2para AVD padrão e 10.0.3.2para genymotion
const url = 'http://10.0.2.2:3000';
const url_programming =
    "http://10.0.2.2:3000/users_backoffice/eventos/programacao?id=1";

Future<Map> getProgramming() async {
  try {
    http.Response response = await http.get(url_programming);
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

  _cardAtividade(BuildContext context, String data, Map atividade) {
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
                    )
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
                  Text(atividade['titulo'],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(atividade['descricao'], style: TextStyle(fontSize: 18)),
                  Row(children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(atividade['local'],
                          style: TextStyle(fontSize: 18)),
                    )
                  ]),
                ],
              ),
            )),
        onTap: () {
          // popup informations activity
          _showDialog(context);
        });
  }

  _panelData(List dias) {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text(
                "<",
              ),
            ),
            Expanded(
                child: 
                Text(
              dias[0],
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )),
            FlatButton(
              onPressed: () {
                
              },
              child: Text(
                ">",
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: FutureBuilder<Map>(
                future: getProgramming(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Center(
                          child: Text(
                        "Carregando Dados...",
                        style: TextStyle(color: Colors.amber, fontSize: 25.0),
                        textAlign: TextAlign.center,
                      ));
                    default:
                      if (snapshot.hasError || snapshot.data == null)
                        return Center(
                            child: Text(
                          "Erro ao Carregar Dados :(",
                          style: TextStyle(color: Colors.amber, fontSize: 25.0),
                          textAlign: TextAlign.center,
                        ));
                      else
                        return SingleChildScrollView(
                          padding: EdgeInsets.all(5.0),
                          child: Column(children: <Widget>[
                            _panelData(snapshot.data['dias'].map((d) => d['data']).toList()),
                            for (var dia in snapshot.data['dias'])
                              for (var atv in dia['atividades'])
                                _cardAtividade(context, dia['data'], atv),
                          ]),
                        );
                  }
                }))
      ],
    );
  }
}
