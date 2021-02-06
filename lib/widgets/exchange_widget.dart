import 'package:currency_exchange/model/exchange_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExchangeWidget extends StatelessWidget {
  ExchangeData exchangeData;

  Function changeUpperSelection;
  Function changeUpperAmount;
  Function changeLowerSelection;
  Function swapCurrencies;

  ExchangeWidget(
    this.exchangeData,
    this.changeUpperSelection,
    this.changeUpperAmount,
    this.changeLowerSelection,
    this.swapCurrencies,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      elevation: 3,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: (Row(
              children: [
                DropdownButton(
                  value: exchangeData.sourceCurrency,
                  onChanged: (newValue) {
                    changeUpperSelection(newValue);
                  },
                  items: exchangeData.currencies
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size(200, 50)),
                        child: TextFormField(
                          initialValue: exchangeData.amount.toString(),
                          inputFormatters: [
                            new FilteringTextInputFormatter.allow(
                              RegExp("[0-9.]"),
                            )
                          ],
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          onChanged: (String newValue) {
                            double parsedValue;

                            if (newValue == "")
                              parsedValue = 0;
                            else if (newValue.startsWith('.'))
                              parsedValue = double.parse("0$newValue");
                            else
                              parsedValue = double.parse(newValue);

                            changeUpperAmount(parsedValue);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Text(exchangeData.amount.toString()),
              ],
            )),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                DropdownButton(
                  value: exchangeData.targetCurrency,
                  onChanged: (newValue) {
                    changeLowerSelection(newValue);
                  },
                  items: exchangeData.currencies
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Text(exchangeData.convertedAmount.toString()),
              ],
            ),
          ),
          RaisedButton(
            onPressed: swapCurrencies,
            child: Text("Swap"),
          )
        ],
      ),
    );
  }
}
