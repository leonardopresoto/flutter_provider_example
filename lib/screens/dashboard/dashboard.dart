import 'package:flutter/material.dart';
import 'package:flutter_provider_example/screens/dashboard/balance_card.dart';
import 'package:flutter_provider_example/screens/deposit/form.dart';
import 'package:flutter_provider_example/screens/transfer/transfer_form.dart';
import 'package:flutter_provider_example/screens/transfer/last_transfers.dart';

const String _titleAppBar = 'Bytebank';
const String _buttonDepositCash = 'CASH DEPOSIT';
const String _buttonNewTransfer = 'NEW TRANSFER';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: BalanceCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(_buttonDepositCash),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return BalanceForm();
                    }),
                  );
                },
              ),
              RaisedButton(
                child: Text(_buttonNewTransfer),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return TransferForm();
                    }),
                  );
                },
              ),
            ],
          ),
          LastTransfers()
        ],
      ),
    );
  }
}
