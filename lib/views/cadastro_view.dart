import 'package:flutter/material.dart';

class CadstroView extends StatefulWidget {
  @override
  _CadstroViewState createState() => _CadstroViewState();
}

class _CadstroViewState extends State<CadstroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('Em breve cadastro',
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}