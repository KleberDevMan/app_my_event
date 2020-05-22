import 'package:flutter/material.dart';

class ComunicadosView extends StatefulWidget {
  @override
  _ComunicadosViewState createState() => _ComunicadosViewState();
}

class _ComunicadosViewState extends State<ComunicadosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comunicados'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('Em breve',
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}