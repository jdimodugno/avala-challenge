import 'package:currency_exchange/exchange/cubit/exchange_cubit.dart';
import 'package:currency_exchange/exchange/exchange_app.dart';
import 'package:currency_exchange/exchange/model/exchange_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exchange")),
      body: Center(
        child: FutureBuilder(
          future: ExchangeApp.exchangeService.getCurrencies(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                context.read<ExchangeCubit>().changeCurrencies(snapshot.data);

                return BlocBuilder<ExchangeCubit, ExchangeData>(
                  builder: (context, state) {
                    var changeUpperSelection =
                        context.read<ExchangeCubit>().changeSourceCurrency;
                    var changeUpperAmount =
                        context.read<ExchangeCubit>().changeAmount;
                    var changeLowerSelection =
                        context.read<ExchangeCubit>().changeTargetCurrency;
                    var swapCurrencies =
                        context.read<ExchangeCubit>().swapCurrencies;

                    return state.currencies.length > 0
                        ? ExchangeWidget(
                            state,
                            changeUpperSelection,
                            changeUpperAmount,
                            changeLowerSelection,
                            swapCurrencies)
                        : Text("... not reacting ... ");
                  },
                );
              default:
                return Text("... loading ... ");
            }
          },
        ),
      ),
    );
  }
}
