import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/repositories/evento_repository.dart';
import 'package:my_event/stores/evento_store.dart';

class HomeView extends StatelessWidget {
  final _eventoStore = GetIt.instance<EventoStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(EventoRepository.url_production + _eventoStore.evento.img_link),
            Text(_eventoStore.evento.titulo),
          ],
        ),
      ),
    );
  }
}