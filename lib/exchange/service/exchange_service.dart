import 'package:currency_exchange/exchange/network/open_rates_api.dart';

class ExchangeService {
  final OpenRatesAPI api = OpenRatesAPI.instance;
  List<String> currencies = [];

  Future<List<String>> getCurrencies() async {
    if (currencies.isEmpty) currencies = await api.getCurrencies();
    return currencies;
  }

  Future<double> getExchangeRate(
      String sourceCurrency, String targetCurrency) async {
    return await api.getExchangeRate(sourceCurrency, targetCurrency);
  }
}
