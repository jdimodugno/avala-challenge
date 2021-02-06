import 'package:flutter/material.dart';
import 'package:currency_exchange/bloc/currency_bloc.dart';
import 'package:currency_exchange/screens/currency_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final CurrencyBloc currencyBloc = CurrencyBloc();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrencyListPage(),
    );
  }
}
