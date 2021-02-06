import 'package:currency_exchange/main.dart';
import 'package:flutter/material.dart';

class CurrencyListPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Currencies"),
        ),
        body: FutureBuilder(
          future: MyApp.currencyBloc.getCurrencies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
                itemBuilder: (context, index) {
                  if (index >= snapshot.data.length) return null;
                  String currency = snapshot.data[index];
                  return ListTile(title: Text(currency));
                }
            );
          },
        )
    );
  }
}
