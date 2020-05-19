import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoAtividadeDialog extends StatelessWidget {
  Map<String, dynamic> atividadeData = null;
  String data = '';

  InfoAtividadeDialog(this.atividadeData, this.data) {}

  void _showTestDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        //context: _scaffoldKey.currentContext,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Center(child: Text("Information")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              height: 200,
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text('Name of requestor: }'),
                    Text(
                      'Description:' * 20,
                    ),
                    Text(
                      'Help_Description',
                    ),
                    Text(
                      'Type of help needed:Help_TypeNeeded',
                    )
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
                        'Fund',
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
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: RaisedButton(
                        child: new Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color(0xFF121A21),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              )
            ],
          );
        });
  }

  void _showMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Material Dialog'),
            content: Text('This is the content of the material dialog'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    _dismissDialog(context);
                  },
                  child: Text('Close')),
              FlatButton(
                onPressed: () {
                  print('HelloWorld!');
                  _dismissDialog(context);
                },
                child: Text('HelloWorld!'),
              )
            ],
          );
        });
  }

  _dismissDialog(BuildContext context) {
    Navigator.pop(context);
  }

  void _showCupertinoDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Cupertino Dialog'),
            content: Text('This is the content of the cupertino dialog'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    _dismissDialog(context);
                  },
                  child: Text('Close')),
              FlatButton(
                onPressed: () {
                  print('HelloWorld!');
                  _dismissDialog(context);
                },
                child: Text('HelloWorld!'),
              )
            ],
          );
        });
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Chosse an Option'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog(context);
                },
                child: const Text('Option 1'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog(context);
                },
                child: const Text('Option 2'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog(context);
                },
                child: const Text('Option 3'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _dismissDialog(context);
                },
                child: const Text('Option 4'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(
      children: <Widget>[
        // Container(
        //   child:

        SingleChildScrollView(
            // child: Expanded(
            child: Stack(alignment: Alignment.center, children: <Widget>[
          // Container(),

          Container(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                    child: Text(atividadeData['hora'],
                        style: TextStyle(fontSize: 18)),
                  )
                ]),
                SizedBox(
                  height: 10,
                ),
                Text(atividadeData['titulo'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
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
                        atividadeData['local'],
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
          // ),
        ])),

        // ),
        Container(color: Colors.red)
      ],
    ));

    // Card(
    //   child: Column(
    //     children: <Widget>[

    //       // SingleChildScrollView(
    //       //     // child: Expanded(
    //       //     child: Stack(alignment: Alignment.center, children: <Widget>[
    //       //   // Container(),

    //       //   Container(
    //       //     padding: EdgeInsets.only(top: 10, right: 10, left: 10),
    //       //     child: Column(
    //       //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       //       children: <Widget>[
    //       //         Row(children: <Widget>[
    //       //           Icon(
    //       //             Icons.calendar_today,
    //       //             color: Colors.blue,
    //       //             size: 20.0,
    //       //           ),
    //       //           Padding(
    //       //             padding: EdgeInsets.only(left: 10),
    //       //             child: Text(data, style: TextStyle(fontSize: 18)),
    //       //           ),
    //       //         ]),
    //       //         Row(children: <Widget>[
    //       //           Icon(
    //       //             Icons.access_time,
    //       //             color: Colors.blue,
    //       //             size: 20.0,
    //       //           ),
    //       //           Padding(
    //       //             padding: EdgeInsets.only(left: 10),
    //       //             child: Text(atividadeData['hora'],
    //       //                 style: TextStyle(fontSize: 18)),
    //       //           )
    //       //         ]),
    //       //         SizedBox(
    //       //           height: 10,
    //       //         ),
    //       //         Text(atividadeData['titulo'],
    //       //             style: TextStyle(
    //       //               fontSize: 22,
    //       //               fontWeight: FontWeight.bold,
    //       //             )),
    //       //         SizedBox(
    //       //           height: 20,
    //       //         ),
    //       //         Text(
    //       //             "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    //       //             // overflow: TextOverflow.ellipsis,
    //       //             style: TextStyle(fontSize: 18)),
    //       //         SizedBox(
    //       //           height: 20,
    //       //         ),
    //       //         Row(children: <Widget>[
    //       //           Icon(
    //       //             Icons.location_on,
    //       //             color: Colors.blue,
    //       //             size: 20.0,
    //       //           ),
    //       //           // SizedBox(
    //       //           //   height: 50,
    //       //           // ),
    //       //           Flexible(
    //       //             child: Container(
    //       //               padding: new EdgeInsets.only(left: 10),
    //       //               child: new Text(
    //       //                 atividadeData['local'],
    //       //                 // overflow: TextOverflow.ellipsis,
    //       //                 style: new TextStyle(
    //       //                   fontSize: 18.0,
    //       //                 ),
    //       //               ),
    //       //             ),
    //       //           ),
    //       //         ]),
    //       //       ],
    //       //     ),
    //       //   ),
    //       //   // ),
    //       // ])),

    //       Row(
    //         children: <Widget>[
    //           RaisedButton(
    //             onPressed: () => print('closing'),
    //             child: Text('Fechar',
    //                 style: TextStyle(color: Colors.white, fontSize: 25.0)),
    //             color: Colors.red,
    //           ),
    //           RaisedButton(
    //             onPressed: () => print('inscrever-se'),
    //             child: Text('Inscrever-se',
    //                 style: TextStyle(color: Colors.white, fontSize: 25.0)),
    //             color: Colors.blue[800],
    //           ),
    //         ],
    //       )

    //     ],
    //   ),
    // ),
    // );
  }
}
