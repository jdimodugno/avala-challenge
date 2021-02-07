import 'package:bloc/bloc.dart';
import 'package:currency_exchange/exchange/exchange_observer.dart';
import 'package:flutter/material.dart';
import 'exchange/exchange_app.dart';

void main() {
  Bloc.observer = ExchangeObserver();
  runApp(ExchangeApp());
}
