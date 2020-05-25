// menu hamburguer

import 'package:flutter/material.dart';
import 'package:my_event/repositories/user_repository.dart';
import 'package:my_event/views/login_view.dart';
import 'package:scoped_model/scoped_model.dart';

import 'custom_background_gradient.dart';
import 'custom_drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          CustomBackgroundGradient(),
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
                        child: ScopedModelDescendant<UserRepository>(
                            builder: (context, child, model) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  'Olá, ${model.isLoggedIn() ? model.userData['name'] : ''}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              GestureDetector(
                                child: Text(
                                  model.isLoggedIn()
                                      ? 'Sair'
                                      : "Entre ou cadastre-se",
                                  style: TextStyle(
                                      color: Colors.green[500],
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                onTap: () {
                                  model.isLoggedIn()
                                      ? model.signOut()
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginView(),
                                          ),
                                        );
                                },
                              )
                            ],
                          );
                        })),
                  ],
                ),
              ),
              Divider(),
              CustomDrawerTile(Icons.assignment, 'Minhas inscrições', 0),
              CustomDrawerTile(Icons.info_outline, 'Sobre', 1),
            ],
          ),
        ],
      ),
    );
  }
}
