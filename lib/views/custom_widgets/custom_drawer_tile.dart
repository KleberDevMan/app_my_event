// usado para contruir uma opção do menu hamburguer

import 'package:flutter/material.dart';
import 'package:my_event/views/inscricoes_view.dart';
import 'package:my_event/views/sobre_view.dart';

class CustomDrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final int page;

  // Construtor
  CustomDrawerTile(this.icon, this.text, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // print('clincando link menu amburguer...');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              switch (page) {
                case 0:
                  return InscricoesView();
                default:
                  return SobreView();
              }
            }),
          );
        },
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(icon, size: 32, color: Colors.white70),
              SizedBox(
                width: 32,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              )
            ],
          ),
        ),
      ),
    );
  }
}
