import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_provider_example/components/editor.dart';
import 'package:flutter_provider_example/models/balance.dart';
import 'package:flutter_provider_example/models/transfers.dart';
import 'package:flutter_provider_example/models/transfer.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Creating a new Transfer';

const _labelFieldValue = 'Value';
const _hintFieldValue = '0.00';

const _labelFieldAccountNumber = 'Account Number';
const _hintFieldAccountNumber = '0000';

const _buttonConfirm = 'CONFIRM';

final _snackbarErrorText =
    'Insufficient balance to make this transfer';

class TransferForm extends StatelessWidget {
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Editor(
                  controller: _accountNumberController,
                  hint: _hintFieldAccountNumber,
                  label: _labelFieldAccountNumber,
                ),
                Editor(
                  hint: _hintFieldValue,
                  controller: _valueController,
                  label: _labelFieldValue,
                  icon: Icons.monetization_on,
                ),
                RaisedButton(
                    child: Text(_buttonConfirm),
                    onPressed: () => _createNewTransfer(context)),
              ],
            ),
          ),
        ));
  }

  void _createNewTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_accountNumberController.text);
    final double value = double.tryParse(_valueController.text);
    if (_isValidTransfer(context, accountNumber, value)) {
      final newTransfer = Transfer(value, accountNumber);
      Provider.of<Transfers>(context, listen: false).add(newTransfer);
      Provider.of<Balance>(context, listen: false).subtract(value);
      Navigator.pop(context);
    } else {
      _valueController.text = '';
      showSnackBar(context);
    }
  }

  void showSnackBar(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      elevation: 10,
      backgroundColor: Colors.red[700],
      content: Row(
        children: [
          Expanded(
            child: Text(
              _snackbarErrorText,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Icon(Icons.thumb_down),
        ],
      ),
    ));
  }

  bool _isValidTransfer(
          BuildContext context, int accountNumber, double value) =>
      accountNumber != null &&
      value != null &&
      value <= Provider.of<Balance>(context, listen: false).value;
}
