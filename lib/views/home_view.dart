import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_event/views/comunicados_view.dart';
import 'package:my_event/views/tabs/informacoes_tab.dart';
import 'package:my_event/views/tabs/programacao_tab.dart';

import 'custom_widgets/custom_drawer.dart';
// import 'package:my_event/widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

  @override
  Widget build(BuildContext context) {
    // sair com mensagem de confirmação
    Future<bool> _onBackPressed() {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text('Confirmação'),
              content: new Text('Você realmente deseja sair?'),
              actions: <Widget>[
                new GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Text("Não"),
                ),
                SizedBox(height: 16),
                new GestureDetector(
                  onTap: () => exit(0),
                  child: Text("Sim"),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      // onWillPop: () {
      //   // exit(0);
      //   _onBackPressed();
      // },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[800],
            //Usando um widget de bilder para aceitar gestor de estados pageController
            title: AnimatedBuilder(
                animation: _pageController,
                builder: (_, __) {
                  return Text(['Informações', 'Programação'][_page]);
                }),
            centerTitle: true,
            actions: <Widget>[
              _page == 0
                  ? Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ComunicadosView(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.notifications,
                          size: 26.0,
                        ),
                      ))
                  : Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(
                          Icons.tune,
                          size: 26.0,
                        ),
                      )),
            ]),
        backgroundColor: Colors.grey[850],
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              primaryColor: Colors.white,
              textTheme: Theme.of(context).textTheme.copyWith(
                    caption: TextStyle(color: Colors.white70),
                  ),
            ),
            child: BottomNavigationBar(
                backgroundColor: Colors.grey[850],
                currentIndex: _page,
                onTap: (p) {
                  _pageController.animateToPage(p,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.info), title: Text('Informações')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.timeline), title: Text('Programação')),
                ])),
        body: PageView(
          controller: _pageController,
          onPageChanged: (p) {
            setState(() {
              _page = p;
            });
          },
          children: <Widget>[
            InformacoesTab(),
            ProgramacaoTab(),
          ],
        ),
        drawer: CustomDrawer(),
      ),
    );
  }
}
