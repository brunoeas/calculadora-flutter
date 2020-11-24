import 'package:math_expressions/math_expressions.dart';

class Memoria {
  static const String AC = 'AC';
  static const String PERCENT = '%';
  static const String DIVISION = '/';
  static const String MULTIPLICATION = 'x';
  static const String MINUS = '-';
  static const String PLUS = '+';
  static const String EQUAL = '=';
  static const String DECIMAL_SEPARATOR = ',';
  static const String ZERO = '0';
  static const String ONE = '1';
  static const String TWO = '2';
  static const String THREE = '3';
  static const String FOUR = '4';
  static const String FIVE = '5';
  static const String SIX = '6';
  static const String SEVEN = '7';
  static const String EIGHT = '8';
  static const String NINE = '9';

  final Parser _parser = Parser();

  String _valueToShow = '0';
  String _operation;
  double _value1 = 0;
  double _value2 = 0;

  void applyCommand(final String command) {
    if (command == AC) {
      _clearAllState();
      _logState();
      return;
    }

    if (command == PERCENT && _valueToShow != ZERO) {
      if (_operation == null) {
        _value1 = _value1 / 100;
        _valueToShow = _value1.toString();
      } else {
        _value2 = (_value2 / 100) * _value1;
        _valueToShow = _value2.toString();
      }
      return;
    }

    if (command == EQUAL && (_value1 != 0 && _value2 != 0)) {
      final Expression exp =
          _parser.parse(_value1.toString() + _operation + _value2.toString());
      _clearAllState();
      _valueToShow = exp
          .evaluate(EvaluationType.REAL, null)
          .toString()
          .replaceAll('.', ',');

      final String decimals = _valueToShow.split(',')[1];
      if (decimals == '0') {
        _valueToShow = _valueToShow.split(',')[0];
      }

      _value1 = double.parse(_valueToShow.replaceAll(',', '.'));
      _logState();
      return;
    }

    if (command == DECIMAL_SEPARATOR &&
        _valueToShow.contains(DECIMAL_SEPARATOR)) {
      return;
    }
    if (command == DECIMAL_SEPARATOR) {
      _valueToShow += command;
      return;
    }

    if (_isOperation(command) && _value1 == null) {
      _logState();
      return;
    }
    if (_isOperation(command) && _value1 != null) {
      _operation = command;
      _clearDisplay();
      _logState();
      return;
    }

    if (_valueToShow == ZERO && command != ZERO) {
      _valueToShow = '';
    }
    if (_valueToShow == '' && command == ZERO) {
      _logState();
      return;
    }

    if (_operation == null) {
      if (_valueToShow.contains(DECIMAL_SEPARATOR)) {
        _value1 = double.parse(_value1.toString() + command);
      } else {
        _value1 = double.parse(_value1.toString().split('.')[0] + command);
      }

      _valueToShow += command;
    } else {
      if (_valueToShow.contains(DECIMAL_SEPARATOR)) {
        _value2 = double.parse(_value2.toString() + command);
      } else {
        _value2 = double.parse(_value2.toString().split('.')[0] + command);
      }

      _valueToShow += command;
    }
    _logState();
  }

  void _logState() {
    print('operação: ' + (_operation != null ? _operation : 'null'));
    print('Valor 1: ' + _value1.toString());
    print('Valor 2: ' + _value2.toString());
  }

  bool _isOperation(final String command) {
    try {
      double.parse(command);
      return false;
    } catch (e) {
      return true;
    }
  }

  void _clearAllState() {
    _valueToShow = '0';
    _operation = null;
    _value1 = 0;
    _value2 = 0;
  }

  void _clearDisplay() {
    _valueToShow = '0';
  }

  String get value {
    return this._valueToShow;
  }
}
