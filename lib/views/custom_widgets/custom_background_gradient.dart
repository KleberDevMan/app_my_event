import 'package:flutter/material.dart';

class CustomBackgroundGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.grey[700], Colors.black38],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      );
  }
}