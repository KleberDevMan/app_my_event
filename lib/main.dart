import 'package:flutter/material.dart';
import 'package:my_event/controllersOld/eventoController.dart';
import 'package:my_event/stores/evento_store.dart';
import 'package:my_event/ui/code_event.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/views/code_view.dart';

final getIt = GetIt.instance;

// todo projeto inicia aqui, no main
void main() {
  getIt.registerSingleton<EventoStore>(EventoStore());

  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
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
    // return CodeEvent();
    return CodeView();
  }
}
