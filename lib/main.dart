import 'package:flutter/material.dart';
import 'package:my_event/ui/info.dart';
import 'package:my_event/ui/programming.dart';

// todo projeto inicia aqui, no main
void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange),
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
    return Scaffold(
        appBar: AppBar(
          //Usando um widget de bilder para aceitar gestor de estados pageController
          title: AnimatedBuilder(
              animation: pageController,
              builder: (_, __) {
                return Text(
                  ['Informações', 'Programação'][indexPage]);
              }),
          centerTitle: true,
        ),
        body: PageView(controller: pageController, children: <Widget>[
          PageInfo(),
          PageProgramming(),
        ]),
        bottomNavigationBar: AnimatedBuilder(
            animation: pageController,
            builder: (_, __) {
              return BottomNavigationBar(
                  onTap: (index) {
                    pageController.animateToPage(index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                  currentIndex: indexPage,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.info), title: Text('Informações')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.timeline), title: Text('Programação')),
                  ]);
            }) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
