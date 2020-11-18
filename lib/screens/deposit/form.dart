import 'package:flutter/material.dart';
import 'package:flutter_provider_example/components/editor.dart';
import 'package:flutter_provider_example/models/balance.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Receiving a deposit';
const _labelFieldValue = 'Value';
const _hintFieldValue = '0.00';
const _buttonConfirm = 'CONFIRM';

class BalanceForm extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                hint: _hintFieldValue,
                controller: _valueController,
                label: _labelFieldValue,
                icon: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(_buttonConfirm),
                onPressed: () => _createNewDeposit(context),
              ),
            ],
          ),
        ));
  }

  void _createNewDeposit(BuildContext context) {
    final double value = double.tryParse(_valueController.text);

    if (_isValidDeposit(context, value)) {
      _updateState(context, value);
      Navigator.pop(context);
    }
  }

  _isValidDeposit(context, value) {
    return value != null;
  }

  _updateState(context, value) {
    Provider.of<Balance>(context, listen: false).add(value);
  }
}
