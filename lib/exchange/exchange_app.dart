import 'package:currency_exchange/exchange/service/exchange_service.dart';
import 'package:flutter/material.dart';
import 'exchange.dart';

class ExchangeApp extends MaterialApp {
  static final ExchangeService exchangeService = ExchangeService();

  ExchangeApp({Key key}) : super(key: key, home: ExchangePage());
}
