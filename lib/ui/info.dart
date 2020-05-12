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
  List _listCards = ['kleber', 'maria', 'ana'];

  @override
  void initState() {
    super.initState();

    // getEvento().then((map) {
    //   print(map);
    // });
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
                        return SingleChildScrollView(
                          padding: EdgeInsets.all(5.0),
                          child: Column(children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top:10, right: 10, left:10),
                              height: 500,
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.network(
                                      url + snapshot.data['img_link'],
                                      fit: BoxFit.fill,
                                    ),
                                    Text(snapshot.data['titulo'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(snapshot.data['data_inicio_s'],
                                        style: TextStyle(fontSize: 18)),
                                    Text(snapshot.data['local'],
                                        style: TextStyle(fontSize: 18)),
                                    Text(
                                      snapshot.data['descricao'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                elevation: 5,
                                margin: EdgeInsets.only(top: 5),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top:10, right: 10, left:10),
                              height: 450,
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.network(
                                      url + snapshot.data['img_link'],
                                      fit: BoxFit.fill,
                                    ),
                                    Text(snapshot.data['titulo'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(snapshot.data['data_inicio_s'],
                                        style: TextStyle(fontSize: 18)),
                                    Text(snapshot.data['local'],
                                        style: TextStyle(fontSize: 18)),
                                    Text(
                                      snapshot.data['descricao'],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                elevation: 5,
                                margin: EdgeInsets.only(top: 5),
                              ),
                            ),


                          ]),
                        );
                  }
                }))
      ],
    );
  }

  setListCards(AsyncSnapshot snapshot) {
    print(snapshot.data.runtimeType);
  }

  // Card de informacoes
  Widget _cardEvent(BuildContext context, AsyncSnapshot snapshot) {
    return Card(
      color: Colors.black12,
      child: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Image.network(
                "https://flutter.io/images/catalog-widget-placeholder.png"),
            Divider(),
            Text(snapshot.data['titulo'])
          ],
        ),
      ),
    );
  }

  //Card Patrocinadores, Apoiadores, Organizadores
  Widget _cardParceiros(BuildContext context, AsyncSnapshot snapshot) {}
}
