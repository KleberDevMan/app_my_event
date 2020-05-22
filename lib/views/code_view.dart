import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/controllers/code_controller.dart';
import 'package:my_event/controllersOld/eventoController.dart';
import 'package:my_event/menu_bottom.dart';
import 'package:my_event/stores/evento_store.dart';
import 'package:my_event/view-models/evento_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_view.dart';

class CodeView extends StatefulWidget {
  @override
  _CodeEventState createState() => _CodeEventState();
}

class _CodeEventState extends State<CodeView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerTextFieldCode =
      TextEditingController();

  final _controller = CodeController();
  final _eventoStore = GetIt.instance<EventoStore>();

  var model = new EventoViewModel();

  _verificaCodigoJaExiste() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print('código salvo >> ${prefs.getString('codigo')}');
    model.codigo = prefs.getString('codigo') ?? '';

    if (!model.codigo.isEmpty) {
      _controller.buscaEventoPorCodigo(model).then((evento) {
        if (evento != null) {
          // busca os dias do evento retornado
          _controller.setDias(evento).then((value) {
            if (value != null) {
              // deu certo. conseguiu buscar a programacao
              _eventoStore.setEvento(value);
              model.busy = false;
              setState(() {});
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeView(),
                ),
              );
            } else {
              // erro no momento de carregar programacao
              model.error = true;
              model.msg_erro = 'Erro ao carregar programação';
              model.busy = false;
              setState(() {});
            }
          });
        } else {
          model.busy = false;
          setState(() {});
        }
      });
    } else {
      model.busy = false;
      setState(() {});
    }
  }

  _savarCodigoSharedPreferences(String codigo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('codigo', codigo);
    print('código setado >> ${prefs.getString('codigo')}');
  }

  @override
  void initState() {
    super.initState();
    model.busy = true;
    _verificaCodigoJaExiste();

    // // limpar code sharedPreferences
    // _savarCodigoSharedPreferences('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: model.busy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Form(
              key: _formKey,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(),
                  SingleChildScrollView(
                      child: Container(
                    margin: EdgeInsets.only(
                        top: 0, left: 16, bottom: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text('MY EVENT',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70)),
                        Text('v 1.0',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 12, color: Colors.white70)),
                        SizedBox(
                          height: 32,
                        ),
                        Icon(
                          Icons.people_outline,
                          color: Colors.green[800],
                          size: 160,
                        ),
                        if (model.error)
                          Text(model.msg_erro,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.red)),
                        Theme(
                          data: new ThemeData(
                            primaryColor: Colors.green[800],
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.green[800])),
                              hintText: 'Código',
                              hintStyle: TextStyle(color: Colors.white70),
                              labelStyle: TextStyle(color: Colors.green[800]),
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.green[800], fontSize: 25.0),
                            controller: _controllerTextFieldCode,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Insira um código!";
                              }
                            },
                            onSaved: (value) {
                              model.codigo = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Container(
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();

                                    model.busy = true;
                                    setState(() {});

                                    // Busca o evento
                                    _controller
                                        .buscaEventoPorCodigo(model)
                                        .then((evento) {
                                      if (evento != null) {
                                        // busca os dias do evento retornado
                                        _controller
                                            .setDias(evento)
                                            .then((value) {
                                          if (value != null) {
                                            // deu certo. conseguiu buscar a programacao
                                            _eventoStore.setEvento(value);
                                            _savarCodigoSharedPreferences(
                                                model.codigo);

                                            // Redireciona para a home
                                            model.busy = false;
                                            setState(() {});
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeView(),
                                              ),
                                            );
                                          } else {
                                            // erro no momento de carregar programacao
                                            model.error = true;
                                            model.msg_erro =
                                                'Erro ao carregar programação';
                                            model.busy = false;
                                            setState(() {});
                                          }
                                        });
                                      } else {
                                        // erro no momento de carregar evento
                                        model.busy = false;
                                        setState(() {});
                                      }
                                    });
                                  }
                                },
                                child: Text('Buscar',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 25.0)),
                                color: Colors.green[800],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(25.0),
                                    topLeft: Radius.circular(25.0),
                                    bottomRight: Radius.circular(25.0),
                                    bottomLeft: Radius.circular(25.0),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  )),
                ],
              ),
            ),
    );
  }
}
