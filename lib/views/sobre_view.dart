import 'package:flutter/material.dart';
import 'package:my_event/controllers/code_controller.dart';

import 'custom_widgets/custom_background_gradient.dart';

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
