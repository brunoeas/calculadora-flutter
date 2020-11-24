import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final String callbackValue;
  final bool big;
  final Color color;
  final void Function(String) cb;

  Button({
    @required this.text,
    @required this.cb,
    this.callbackValue,
    this.big = false,
    this.color = DEFAULT,
  });
  Button.big({
    @required this.text,
    @required this.cb,
    this.callbackValue,
    this.big = true,
    this.color = DEFAULT,
  });
  Button.operation({
    @required this.text,
    @required this.cb,
    this.callbackValue,
    this.big = false,
    this.color = OPERATION,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: big ? 2 : 1,
      child: RaisedButton(
        color: this.color,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200,
          ),
        ),
        onPressed: () => this.cb(
            this.callbackValue != null && this.callbackValue != ''
                ? this.callbackValue
                : this.text),
      ),
    );
  }
}
