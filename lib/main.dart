import 'package:flutter/material.dart';
import 'package:my_event/repositories/inscricao_repository.dart';
import 'package:my_event/repositories/user_repository.dart';
import 'package:my_event/stores/evento_store.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/views/code_view.dart';
import 'package:scoped_model/scoped_model.dart';

final getIt = GetIt.instance;

// todo projeto inicia aqui, no main
void main() {
  getIt.registerSingleton<EventoStore>(EventoStore());

  runApp(new Home());

  // Firestore.instance.collection('col').document('doc').setData({'texto': 'JUNIO'});
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserRepository>(
        model: UserRepository(),
        child: ScopedModelDescendant<UserRepository>(builder: (context, child, model) {
          return ScopedModel<InscricaoRepository>(
              model: InscricaoRepository(model),
              child: MaterialApp(
                title: 'MyEvent',
                home: CodeView(),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.orange,
                    fontFamily: 'Roboto'),
              ));
        }));
  }
}
