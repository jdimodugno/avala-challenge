import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class OpenRatesAPI {
  static final instance = OpenRatesAPI();

  final String baseUrl = "https://api.exchangeratesapi.io";

  Future<List<String>> getCurrencies() async {
    final response = await http.get("$baseUrl/latest?base=USD");

    if (response.statusCode == 200) {
      Map data = (convert.jsonDecode(response.body)['rates']) as Map;
      return data.keys.toList();
    }

    return [];
  }

  Future<double> getExchangeRate(
      String sourceCurrency, String targetCurrency) async {
    final response = await http
        .get("$baseUrl/latest?base=$sourceCurrency&symbols=$targetCurrency");

    return convert.jsonDecode(response.body)['rates'][targetCurrency];
  }
}
