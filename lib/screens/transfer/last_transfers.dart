import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/transfers.dart';
import 'package:provider/provider.dart';

import 'item.dart';
import 'list.dart';

const _title = 'Last Transfers';
const _buttonVisualize = 'SHOW ALL TRANSFERS';
const _noTransfersYet = 'YOU DON\'T HAVE ANY REGISTERED TRANSFERS YET';

class LastTransfers extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transfers>(
          builder: (context, transfers, child) {
            final _lastTransfers = transfers.transfers.reversed.toList();
            final _amount = transfers.transfers.length;
            int size;

            if (_amount < 3) {
              size = _amount;
            } else {
              size = 2;
            }

            if (_amount == 0) {
              return Card(
                margin: EdgeInsets.all(40),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    _noTransfersYet,
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              shrinkWrap: true,
              itemCount: size,
              itemBuilder: (context, index) {
                final _transfer = _lastTransfers[index];
                final _value = _transfer.toStringValue();
                final _account = _transfer.toStringAccount();

                return Item.transfer(_value, _account);
              },
            );
          },
        ),
        FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return FinancialTransactionsList();
              }),
            );
          },
          child: Text(
            _buttonVisualize,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
                fontSize: 15),
          ),
        )
      ],
    );
  }
}
