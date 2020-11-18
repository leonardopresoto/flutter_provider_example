import 'package:flutter/material.dart';
import 'package:flutter_provider_example/models/balance.dart';
import 'package:flutter_provider_example/screens/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

import 'models/transfers.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Balance(0),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Transfers(),
        )
      ],
      child: ByteBankApp(),
    ));

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.green[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[500],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
