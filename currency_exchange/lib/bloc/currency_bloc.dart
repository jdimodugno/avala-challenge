import 'package:currency_exchange/API.dart';

class CurrencyBloc {
  final OpenRatesAPI api = OpenRatesAPI();
  List<String> currencies = [];

  Future<List<String>> getCurrencies() async {
    currencies = await api.getCurrencies();
    return currencies;
  }
}
