import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/controllersOld/eventoController.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// Requisições HTTP para localhost:
// Use 10.0.2.2para AVD padrão e 10.0.3.2para genymotion
const url = 'http://10.0.2.2:3000';
const url_production = "https://tranquil-earth-03232.herokuapp.com";
const url_evento = url_production + "/users_backoffice/eventos/evento?id=";

Future<Map> _getEvento(int id) async {
  try {
    http.Response response = await http.get(url_evento + "$id");
    return json.decode(response.body);
  } catch (error) {
    print(error);
    return null;
  }
}

class PageInfo extends StatefulWidget {
  @override
  _PageInfoState createState() => _PageInfoState();
}

class _PageInfoState extends State<PageInfo> {
  final eventoController = GetIt.instance<EventoController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: FutureBuilder<Map>(
                future: _getEvento(eventoController.eventoData['id']),
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
                          style: TextStyle(color: Colors.amber, fontSize: 25.0),
                          textAlign: TextAlign.center,
                        ));
                      else
                        return SingleChildScrollView(
                          padding: EdgeInsets.all(5.0),
                          child: Column(children: <Widget>[
                            Container(
                              // backgroundColor: Colors.grey[800]
                              padding:
                                  EdgeInsets.only(top: 10, right: 10, left: 10),
                              height: 500,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Image.network(
                                      url_production + snapshot.data['img_link'],
                                      fit: BoxFit.fill,
                                    ),
                                    Text(snapshot.data['titulo'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Row(children: <Widget>[
                                            Icon(
                                              Icons.calendar_today,
                                              color: Colors.blue,
                                              size: 20.0,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                  snapshot
                                                      .data['data_inicio_s'],
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                            )
                                          ]),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.blue,
                                              size: 20.0,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                  snapshot.data['local'],
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                            )
                                          ]),
                                        ],
                                      ),

                                      // Column(children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 30, right: 10),
                                          child: RaisedButton(
                                            child: Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 20.0,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "Inscrever-se",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                            color: Colors.green[800],
                                            onPressed: () {
                                              print('click...');
                                            },
                                          ),
                                        ),
                                      )

                                      // ]),
                                    ]),
                                    SizedBox(
                                      height: 15,
                                    ),
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
                            if (snapshot.data['patrocinadores'].length > 0)
                              _cardPatrocinadores(
                                  snapshot, 'Patrocínio', 'patrocinadores'),
                            if (snapshot.data['apoiadores'].length > 0)
                              _cardPatrocinadores(
                                  snapshot, 'Apoio', 'apoiadores'),
                            if (snapshot.data['organizadores'].length > 0)
                              _cardPatrocinadores(
                                  snapshot, 'Organização', 'organizadores')
                          ]),
                        );
                  }
                }))
      ],
    );
  }

  List<Widget> _buildGridTiles(AsyncSnapshot snapshot, String parceiros) {
    List<Widget> containers =
        List<Container>.generate(snapshot.data[parceiros].length, (int index) {
      return Container(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          url_production + snapshot.data[parceiros][index]['img_link'],
          fit: BoxFit.fill,
        ),
      ));
    });
    return containers;
  }

  _cardPatrocinadores(
      AsyncSnapshot snapshot, String parceiroTitle, String parceiroTipo) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(parceiroTitle,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            GridView.extent(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                padding: const EdgeInsets.all(5),
                children: _buildGridTiles(snapshot, parceiroTipo))
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 5,
        margin: EdgeInsets.only(top: 5),
      ),
    );
  }
}
