import 'package:intl/intl.dart';

class Transfer {
  final double value;
  final int accountNumber;
  final currencyFormat =
      new NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);

  Transfer(
    this.value,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Transfer{value: $value, accountNumber: $accountNumber}';
  }

  String toStringValue() {
    return '${currencyFormat.format(value)}';
  }

  String toStringAccount() {
    return 'Account Number: $accountNumber';
  }
}
