import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/controllers/pageControllerMobx.dart';
import 'package:my_event/ui/info.dart';
import 'package:my_event/ui/programming.dart';
import 'package:my_event/controllers/eventoController.dart';

class MenuBottom extends StatefulWidget {
  @override
  _MenuBottomState createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  // final eventoController = GetIt.instance<EventoController>();
  // final pageControllerMobx = PageControllerMobx();

  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }


  // se pagina for nula, retorno 0
  // int get indexPage => pageController?.page?.round() ?? 0;

  @override
  Widget build(BuildContext context) {
    return

        // Scaffold(
        //     appBar: AppBar(
        //       //Usando um widget de bilder para aceitar gestor de estados pageController
        //       title: AnimatedBuilder(
        //           animation: pageController,
        //           builder: (_, __) {
        //             return Text(['Informações', 'Programação'][indexPage]);
        //           }),
        //       centerTitle: true,
        //       leading: GestureDetector(
        //         onTap: () {/* Write listener code here */},
        //         child: Icon(
        //           Icons.menu, // add custom icons also
        //         ),
        //       ),
        //       actions: <Widget>[
        //         Observer(
        //           builder: (_) {
        //             return
        //             pageControllerMobx.indexPage == 0 ?
        //             Text('A')
        //             : Text('B');
        //           },
        //         ),

        //         // Padding(
        //         //     padding: EdgeInsets.only(right: 20.0),
        //         //     child: GestureDetector(
        //         //       onTap: () {},
        //         //       child: Icon(
        //         //         Icons.notifications,
        //         //         size: 26.0,
        //         //       ),
        //         //     )),
        //       ],
        //     ),
        //     body: PageView(controller: pageController, children: <Widget>[
        //       PageInfo(),
        //       PageProgramming(),
        //     ]),
        //     bottomNavigationBar: AnimatedBuilder(
        //         animation: pageController,
        //         builder: (_, __) {
        //           pageControllerMobx.setIndexPage(indexPage);
        //           return BottomNavigationBar(
        //               onTap: (index) {
        //                 pageControllerMobx.setIndexPage(indexPage);
        //                 pageController.animateToPage(index,
        //                     duration: Duration(milliseconds: 80),
        //                     curve: Curves.easeInOut);
        //               },
        //               currentIndex: indexPage,
        //               items: [
        //                 BottomNavigationBarItem(
        //                     icon: Icon(Icons.info), title: Text('Informações')),
        //                 BottomNavigationBarItem(
        //                     icon: Icon(Icons.timeline), title: Text('Programação')),
        //               ]);
        //         }) // This trailing comma makes auto-formatting nicer for build methods.
        //     );

        Scaffold(
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.grey[800],
            // splashColor: Colors.yellowAccent,
            // splashColor: Colors.yellowAccent,
            // unselectedWidgetColor: Colors.green,
            primaryColor: Colors.red,
            // primaryColorDark: Colors.red,
            textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(color: Colors.green[800]),
                  button: TextStyle(color: Colors.green[800]),
                ),
          ),
          child: BottomNavigationBar(
              currentIndex: _page,
              onTap: (p) {
                _pageController.animateToPage(p, 
                duration: Duration(milliseconds: 500), 
                curve: Curves.ease);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.info), title: Text('Informações')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.timeline), title: Text('Programação')),
              ])),
      body: PageView(
        onPageChanged: (p) {
          setState(() {
            _page = p;
          });
        },
        children: <Widget>[
          Container(color: Colors.yellow),
          Container(color: Colors.grey),
          
          ],
      ),
    );
  }
}
