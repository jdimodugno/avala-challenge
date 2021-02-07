import 'package:currency_exchange/exchange/cubit/exchange_cubit.dart';
import 'package:currency_exchange/exchange/view/exchange_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExchangePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => ExchangeCubit(), child: ExchangeView());
  }
}
