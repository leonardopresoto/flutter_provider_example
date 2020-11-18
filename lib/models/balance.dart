import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Balance extends ChangeNotifier {
  double value;
  final currencyFormat =
      new NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);

  Balance(this.value);

  void add(double value) {
    this.value += value;
    notifyListeners();
  }

  void subtract(double value) {
    this.value -= value;
    notifyListeners();
  }

  @override
  String toString() {
    return '${currencyFormat.format(value)}';
  }
}
