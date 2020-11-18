import 'package:flutter/material.dart';

const String deposit = 'deposit';
const String credit = 'credit';

class Item extends StatelessWidget {
  final String _value;
  String _account;
  String _tipe;
  final Map<String, Color> _colors = {
    deposit: Colors.red[700],
    credit: Colors.green[700],
  };

  Item(this._value, this._account, this._tipe);

  Item.transfer(this._value, this._account) {
    this._tipe = deposit;
  }
  Item.deposit(this._value) {
    this._tipe = credit;
    this._account = '';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(
        Icons.monetization_on,
        color: _colors[_tipe],
      ),
      title: Text(_value),
      subtitle: Text(_account),
    ));
  }
}
