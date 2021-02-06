import 'package:currency_exchange/API.dart';

class CurrencyBloc {
  final OpenRatesAPI api = OpenRatesAPI.instance;

  List<String> currencies = [];

  Future<List<String>> getCurrencies() async {
    if (currencies.isEmpty) currencies = await api.getCurrencies();
    return currencies;
  }
}
