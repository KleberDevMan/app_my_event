import 'package:flutter/material.dart';

import 'custom_widgets/custom_background_gradient.dart';

class SobreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text('MY EVENT v 1.0',
                  style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20,),
              const Text('Desevnolvido por:'),
              const Text('Kleber Junio Cabral Chaves', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

// class SobreView extends StatefulWidget {
//   @override
//   _SobreViewState createState() => _SobreViewState();
// }

// class _SobreViewState extends State<SobreView> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Scaffold(
//           appBar: AppBar(),
//           body: Container(
//             child: Center(
//               child: Column(
//                 children: <Widget>[
//                   Text('MyEvent v1.0',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   Text('Desevnolvido por: Kleber Junio Cabral Chaves'),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
