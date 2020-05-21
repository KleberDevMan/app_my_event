import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/repositories/evento_repository.dart';
import 'package:my_event/stores/evento_store.dart';

class HomeView extends StatelessWidget {
  final _eventoStore = GetIt.instance<EventoStore>();

  @override
  Widget build(BuildContext context) {
    // // sair com mensagem de confirmação
    // Future<bool> _onBackPressed() {
    //   return showDialog(
    //         context: context,
    //         builder: (context) => new AlertDialog(
    //           title: new Text('Confirmação'),
    //           content: new Text('Você realmente deseja sair?'),
    //           actions: <Widget>[
    //             new GestureDetector(
    //               onTap: () => Navigator.of(context).pop(false),
    //               child: Text("Não"),
    //             ),
    //             SizedBox(height: 16),
    //             new GestureDetector(
    //               onTap: ()=> exit(0),
    //               child: Text("Sim"),
    //             ),
    //           ],
    //         ),
    //       ) ??
    //       false;
    // }

    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(EventoRepository.url_production +
                  _eventoStore.evento.img_link),
              Text(_eventoStore.evento.titulo),
            ],
          ),
        ),
      ),
    );
  }
}
