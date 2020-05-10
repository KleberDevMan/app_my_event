import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// Requisições HTTP para localhost:
// Use 10.0.2.2para AVD padrão e 10.0.3.2para genymotion
const url_programacao =
    "http://10.0.2.2:3000/users_backoffice/eventos/programacao?id=1";
const url_evento =
    "http://10.0.2.2:3000/users_backoffice/eventos/evento?id=1";

Future<Map> getEvento() async {
  http.Response response = await http.get(url_evento);
  return json.decode(response.body);
}

class PageInfo extends StatefulWidget {
  @override
  _PageInfoState createState() => _PageInfoState();
}

class _PageInfoState extends State<PageInfo> {

  @override
  void initState() {
    super.initState();

    getEvento().then((map){
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }

}
