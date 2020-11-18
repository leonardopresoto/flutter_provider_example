import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/transfers.dart';
import 'package:flutter_provider_example/models/transfer.dart';
import 'package:flutter_provider_example/screens/transfer/item.dart';
import 'package:provider/provider.dart';

import 'transfer_form.dart';

const _titleAppBar = 'Extract';

class FinancialTransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Consumer<Transfers>(
        builder: (context, transfers, child) {
          return ListView.builder(
            itemCount: transfers.transfers.length,
            itemBuilder: (context, index) {
              final transfer = transfers.transfers[index];

              return Item.transfer(
                transfer.toStringValue(),
                transfer.toStringAccount(),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
        },
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transfer.toStringValue()),
      subtitle: Text(_transfer.toStringAccount()),
    ));
  }
}
