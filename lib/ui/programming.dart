import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// Requisições HTTP para localhost:
// Use 10.0.2.2para AVD padrão e 10.0.3.2para genymotion
const url_programming =
    "http://10.0.2.2:3000/users_backoffice/eventos/programacao?id=1";

Future<Map> getProgramming() async {
  http.Response response = await http.get(url_programming);
  return json.decode(response.body);
}

class PageProgramming extends StatefulWidget {
  @override
  _PageProgrammingState createState() => _PageProgrammingState();
}

class _PageProgrammingState extends State<PageProgramming> {

  @override
  void initState() {
    super.initState();

    getProgramming().then((map){
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }

}
