import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// Requisições HTTP para localhost:
// Use 10.0.2.2para AVD padrão e 10.0.3.2para genymotion
const url = 'http://10.0.2.2:3000';
const url_evento = "http://10.0.2.2:3000/users_backoffice/eventos/evento?id=1";

Future<Map> getEvento() async {
  try {
    http.Response response = await http.get(url_evento);
    return json.decode(response.body);
  } catch (error) {
    print(error);
  }
}

class PageInfo extends StatefulWidget {
  @override
  _PageInfoState createState() => _PageInfoState();
}

class _PageInfoState extends State<PageInfo> {
  @override
  void initState() {
    super.initState();

    getEvento().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container(color: Colors.red);
    return Column(
      children: <Widget>[
        Expanded(
            child: FutureBuilder<Map>(
                future: getEvento(),
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
                        return cardEvent(context, snapshot);
                  }
                }))
      ],
    );
  }

  // Card de informacoes
  Widget cardEvent(BuildContext context, AsyncSnapshot snapshot) {
    return Card(
      color: Colors.black12,
      child: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Image.network("https://flutter.io/images/catalog-widget-placeholder.png"),
            Divider(),
            Text(snapshot.data['titulo'])
          ],
        ),
      ),
    );
  }

  //Card Patrocinadores, Apoiadores, Organizadores
  Widget cardParceiros(BuildContext context, AsyncSnapshot snapshot) {}
}
