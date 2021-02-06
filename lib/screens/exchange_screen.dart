import 'package:currency_exchange/bloc/exchange_bloc.dart';
import 'package:currency_exchange/model/exchange_data.dart';
import 'package:currency_exchange/widgets/exchange_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExchangeView extends StatefulWidget {
  static final ExchangeBloc exchangeBloc = ExchangeBloc();

  @override
  _ExchangeViewState createState() => _ExchangeViewState();
}

class _ExchangeViewState extends State<ExchangeView> {
  ExchangeData exchangeData;

  @override
  Widget build(BuildContext context) {
    initializeWidget();

    return Scaffold(
        appBar: AppBar(
          title: Text("Exchange"),
        ),
        body: FutureBuilder<ExchangeData>(
          future: ExchangeView.exchangeBloc.getCurrentExchange(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Center(
                    child: ExchangeWidget(
                  snapshot.data,
                  ExchangeView.exchangeBloc.updateSourceCurrency,
                  ExchangeView.exchangeBloc.updateAmount,
                  ExchangeView.exchangeBloc.updateTargetCurrency,
                  ExchangeView.exchangeBloc.swapCurrencies,
                ));
              default:
                return CircularProgressIndicator();
            }
          },
        ));
  }

  void updateExchangeData(ExchangeData data) {
    print('source value: ${data.sourceCurrency}');
    print('target value: ${data.targetCurrency}');
    print('converted value: ${data.convertedAmount}');
  }

  void initializeWidget() async {
    ExchangeView.exchangeBloc.subscribeCallback(updateExchangeData);
  }
}
