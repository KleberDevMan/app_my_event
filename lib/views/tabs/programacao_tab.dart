import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_event/models/atividade_model.dart';
import 'package:my_event/stores/evento_store.dart';
import 'package:my_event/views/custom_widgets/custom_background_gradient.dart';

class ProgramacaoTab extends StatefulWidget {
  @override
  _ProgramacaoTabState createState() => _ProgramacaoTabState();
}

class _ProgramacaoTabState extends State<ProgramacaoTab> {
  int _indexDias = 0;
  bool nextDiaIsValid = true;

  final _eventoStore = GetIt.instance<EventoStore>();

  _lastDia() {
    setState(() {
      _indexDias--;
    });
  }

  _nextDia() {
    setState(() {
      _indexDias++;
    });
  }

  _cardAtividade(BuildContext context, AtividadeModel atividade, String data) {
    return GestureDetector(
        child: Container(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 5,
              margin: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(data, style: TextStyle(fontSize: 18)),
                    ),
                  ]),
                  Row(children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child:
                          Text(atividade.hora, style: TextStyle(fontSize: 18)),
                    )
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(atividade.titulo,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(atividade.descricao,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18)),
                  Row(children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.blue,
                      size: 20.0,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Flexible(
                      child: Container(
                        padding: new EdgeInsets.only(left: 10),
                        child: new Text(
                          atividade.local,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            )),
        onTap: () {
          // _showDialog(context);
          _showTestDialog(context, atividade, data);
        });
  }

  _panelData() {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            FlatButton(
              onPressed: _indexDias > 0 ? () => _lastDia() : null,
              child: Text(
                "<",
              ),
            ),
            Expanded(
                child: Text(
              _eventoStore.evento.dias[_indexDias].data,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            )),
            FlatButton(
              onPressed: _eventoStore.evento.dias.length > (_indexDias + 1)
                  ? () => _nextDia()
                  : null,
              child: Text(
                ">",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTestDialog(
      BuildContext context, AtividadeModel atividade, String data) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(top: 10, left: 25, right: 25),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              height: 500,
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(
                        Icons.calendar_today,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(data, style: TextStyle(fontSize: 18)),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(atividade.hora,
                            style: TextStyle(fontSize: 18)),
                      )
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    Text(atividade.titulo,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text(atividade.descricao,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 20.0,
                      ),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      Flexible(
                        child: Container(
                          padding: new EdgeInsets.only(left: 10),
                          child: new Text(
                            atividade.local,
                            // overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: RaisedButton(
                      child: new Text(
                        'Fechar',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Color(0xFF121A21),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        //saveIssue();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.01,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 70.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: RaisedButton(
                        child: new Text(
                          'Inscrever-se',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue[800],
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),

                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomBackgroundGradient(),
        Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(5.0),
                child: Column(children: <Widget>[
                  _panelData(),
                  for (var atv
                      in _eventoStore.evento.dias[_indexDias].atividades)
                    _cardAtividade(context, atv,
                        _eventoStore.evento.dias[_indexDias].data),
                ]),
              ),
            )
          ],
        ),
      ],
    );
  }
}
