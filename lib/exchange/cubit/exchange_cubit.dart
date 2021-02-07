import 'package:bloc/bloc.dart';
import 'package:currency_exchange/exchange/model/exchange_data.dart';
import 'package:currency_exchange/exchange/service/exchange_service.dart';

class ExchangeCubit extends Cubit<ExchangeData> {
  ExchangeCubit() : super(ExchangeData(['USD'], 1, 1, 'USD', 'USD'));

  void changeCurrencies(List<String> currencies) {
    emit(ExchangeData(currencies, state.amount, state.convertedAmount,
        state.sourceCurrency, state.targetCurrency));
  }

  void changeSourceCurrency(String newSource) {
    emit(ExchangeData(
      state.currencies,
      state.amount,
      state.convertedAmount,
      newSource,
      state.targetCurrency,
    ));
    updateConvertedAmount();
  }

  void changeTargetCurrency(String newTarget) {
    emit(ExchangeData(
      state.currencies,
      state.amount,
      state.convertedAmount,
      state.sourceCurrency,
      newTarget,
    ));
    updateConvertedAmount();
  }

  void changeAmount(double amount) {
    emit(ExchangeData(
      state.currencies,
      amount,
      state.convertedAmount,
      state.sourceCurrency,
      state.targetCurrency,
    ));
    updateConvertedAmount();
  }

  void updateConvertedAmount() {
    ExchangeService()
        .getExchangeRate(state.sourceCurrency, state.targetCurrency)
        .then((newConversionRate) {
      emit(ExchangeData(
        state.currencies,
        state.amount,
        (state.amount * newConversionRate),
        state.sourceCurrency,
        state.targetCurrency,
      ));
    });
  }

  void swapCurrencies() {
    emit(ExchangeData(
      state.currencies,
      state.amount,
      state.convertedAmount,
      state.targetCurrency,
      state.sourceCurrency,
    ));
    updateConvertedAmount();
  }
}
