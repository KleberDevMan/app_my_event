import 'package:flutter/material.dart';
import 'package:my_event/tiles/DrawerTile.dart';

class CustomDrawer extends StatelessWidget {
  Widget _buildDrawerBack() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey[700], Colors.black38],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(top: 10, left: 32),
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 10),
                margin: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 130,
                // ao contrário da Column, a stack me permite posicionar os elementos na direita ou na esquerda
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 12,
                        left: MediaQuery.of(context).size.width * 0.2,
                        child: Text('MY EVENT',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70))),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Olá',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          GestureDetector(
                            child: Text(
                              "Entre ou cadastre-se >",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              print('login...');
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.assignment, 'Minhas inscrições'),
              DrawerTile(Icons.info_outline, 'Sobre'),
            ],
          ),
        ],
      ),
    );
  }
}
