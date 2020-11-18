import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_example/models/transfer.dart';

class Transfers extends ChangeNotifier {
  final List<Transfer> _transfers = [];

  List<Transfer> get transfers => _transfers;

  add(Transfer newTransfer) {
    transfers.add(newTransfer);
    notifyListeners();
  }
}
