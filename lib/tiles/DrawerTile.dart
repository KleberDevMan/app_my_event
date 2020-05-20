import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;

  // Construtor
  DrawerTile(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          print('clincando link menu amburguer...');
        },
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32,
                color: Colors.white70
              ),
              SizedBox(width: 32,),
              Text(text, style: TextStyle(fontSize: 16, color: Colors.white70),)
            ],
          ),
        ),
      ),
    );
  }
}