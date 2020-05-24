import 'package:flutter/material.dart';


class SobreView extends StatelessWidget {
  // final _controller = CodeController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('MY EVENT',
                  style: TextStyle(fontSize: 18)),
              const Text('v 1.0.1'),
                  SizedBox(height: 40,),
              const Text('Desenvolvido por:'),
              const Text('Kleber Junio Cabral Chaves', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}