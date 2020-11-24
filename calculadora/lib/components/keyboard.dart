import 'package:calculadora/components/button.dart';
import 'package:calculadora/components/button_row.dart';
import 'package:calculadora/models/memory.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) cb;

  Keyboard(this.cb);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          ButtonRow([
            Button.big(
              text: Memoria.AC,
              color: Button.DARK,
              cb: this.cb,
            ),
            Button(
              text: Memoria.PERCENT,
              color: Button.DARK,
              cb: this.cb,
            ),
            Button.operation(
              text: Memoria.DIVISION,
              cb: this.cb,
            ),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(
              text: Memoria.SEVEN,
              cb: this.cb,
            ),
            Button(
              text: Memoria.EIGHT,
              cb: this.cb,
            ),
            Button(
              text: Memoria.NINE,
              cb: this.cb,
            ),
            Button.operation(
              text: Memoria.MULTIPLICATION,
              callbackValue: '*',
              cb: this.cb,
            ),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(
              text: Memoria.FOUR,
              cb: this.cb,
            ),
            Button(
              text: Memoria.FIVE,
              cb: this.cb,
            ),
            Button(
              text: Memoria.SIX,
              cb: this.cb,
            ),
            Button.operation(
              text: Memoria.MINUS,
              cb: this.cb,
            ),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button(
              text: Memoria.ONE,
              cb: this.cb,
            ),
            Button(
              text: Memoria.TWO,
              cb: this.cb,
            ),
            Button(
              text: Memoria.THREE,
              cb: this.cb,
            ),
            Button.operation(
              text: Memoria.PLUS,
              cb: this.cb,
            ),
          ]),
          SizedBox(height: 1),
          ButtonRow([
            Button.big(
              text: Memoria.ZERO,
              cb: this.cb,
            ),
            Button(
              text: Memoria.DECIMAL_SEPARATOR,
              cb: this.cb,
            ),
            Button.operation(
              text: Memoria.EQUAL,
              cb: this.cb,
            ),
          ]),
        ],
      ),
    );
  }
}
