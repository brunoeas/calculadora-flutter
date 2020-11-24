import 'package:calculadora/components/keyboard.dart';
import 'package:calculadora/models/memory.dart';
import 'package:flutter/material.dart';
import 'package:calculadora/components/display.dart';
import 'package:flutter/services.dart';

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final Memoria memoria = Memoria();

  _onPressed(String command) {
    setState(() {
      memoria.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      home: Column(
        children: [
          Display(memoria.value),
          Keyboard(this._onPressed),
        ],
      ),
    );
  }
}
