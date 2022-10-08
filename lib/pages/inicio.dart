import 'package:flutter/material.dart';
import 'package:actividad3/pages/principal.dart';

class Actividad3 extends StatelessWidget {
  const Actividad3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ActividadEv3',
      home: principal(),
    );
  }
}
