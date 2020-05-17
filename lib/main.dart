import 'package:flutter/material.dart';
import 'package:my_event/menu_bottom.dart';
import 'package:my_event/ui/code_event.dart';
// import 'package:my_event/ui/info.dart';
// import 'package:my_event/ui/programming.dart';

// todo projeto inicia aqui, no main
void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto'),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final pageController = PageController();

  // se pagina for nula, retorno 0
  int get indexPage => pageController?.page?.round() ?? 0;

  @override
  Widget build(BuildContext context) {
    return CodeEvent();
  }
}
