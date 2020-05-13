import 'dart:io';

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
  }
}

class PageProgramming extends StatefulWidget {
  @override
  _PageProgrammingState createState() => _PageProgrammingState();
}

class _PageProgrammingState extends State<PageProgramming> {
  _cardAtividade() {
    return Container(
        padding: EdgeInsets.only(top: 10, right: 10, left: 10),
        width: MediaQuery.of(context).size.width,
        height: 400,
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
                  child: Text('14/05/2020', style: TextStyle(fontSize: 18)),
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
                  child: Text('08:00 às 08:30', style: TextStyle(fontSize: 18)),
                )
              ]),
              Text('Abertura conferência',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              Text('Momento social.', style: TextStyle(fontSize: 18)),
              Row(children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.blue,
                  size: 20.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Palmas/TO', style: TextStyle(fontSize: 18)),
                )
              ]),
            ],
          ),
        ));
  }

  _panelData() {
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
            Expanded(child: Text('14/05/2020', style: TextStyle(fontSize: 18))),
            FlatButton(
              onPressed: () {},
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
  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[_panelData(), _cardAtividade()],
      ),
    );
  }
}
