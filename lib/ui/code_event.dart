import 'package:flutter/material.dart';

class CodeEvent extends StatefulWidget {
  @override
  _CodeEventState createState() => _CodeEventState();
}

class _CodeEventState extends State<CodeEvent> {
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _entrar() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Form(
        key: _formKey,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(),
            SingleChildScrollView(
                child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('MY EVENT', textAlign: TextAlign.center),
                  SizedBox(
                    height: 32,
                  ),
                  Icon(
                    Icons.people_outline,
                    color: Colors.green[800],
                    size: 160,
                  ),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        hintText: 'Código',
                        labelStyle: TextStyle(color: Colors.green),
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 25.0),
                      controller: heightController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira um código!";
                        }
                      }),
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
                              _entrar();
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
