import 'package:currency_exchange/API.dart';
import 'package:currency_exchange/bloc/currency_bloc.dart';
import 'package:currency_exchange/model/exchange_data.dart';

class ExchangeBloc {
  static final CurrencyBloc _currencyBloc = CurrencyBloc();
  List<String> currencies = [];

  final OpenRatesAPI api = OpenRatesAPI.instance;

  String _sourceCurrency = "USD";
  String _targetCurrency = "USD";
  double _currentExchangeRate = 2;
  double _amount = 1;

  Future<void> updateExchangeRate() async {
    _updateExchangeRate(
        await api.getExchangeRate(this._sourceCurrency, this._targetCurrency));
  }

  void _updateExchangeRate(double rate) {
    this._currentExchangeRate = rate;
  }

  void updateSourceCurrency(String source) async {
    this._sourceCurrency = source;
    await updateExchangeRate();
    notify();
  }

  void updateAmount(double amount) {
    this._amount = amount;
    notify();
  }

  void updateTargetCurrency(String target) async {
    this._targetCurrency = target;
    await updateExchangeRate();
    notify();
  }

  void swapCurrencies() async {
    var swap = this._sourceCurrency;
    this._sourceCurrency = this._targetCurrency;
    this._targetCurrency = swap;
    await updateExchangeRate();
    notify();
  }

  Future<ExchangeData> getCurrentExchange() async {
    currencies = await _currencyBloc.getCurrencies();
    ExchangeData data = new ExchangeData(
      currencies,
      _amount,
      double.parse((_amount * _currentExchangeRate).toStringAsFixed(2)),
      _sourceCurrency,
      _targetCurrency,
    );
    return data;
  }

  // Observer [kind of]
  Function _subscribedCallback;

  void notify() async {
    var newData = await getCurrentExchange();
    this._subscribedCallback(newData);
  }

  void subscribeCallback(Function callback) {
    this._subscribedCallback = callback;
  }
}
