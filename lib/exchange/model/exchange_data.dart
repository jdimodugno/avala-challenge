class ExchangeData {
  List<String> currencies;
  double amount;
  double convertedAmount;
  String sourceCurrency;
  String targetCurrency;

  ExchangeData(List<String> currencies, double amount, double convertedAmount,
      String sourceCurrency, String targetCurrency) {
    this.convertedAmount = convertedAmount;
    this.sourceCurrency = sourceCurrency;
    this.targetCurrency = targetCurrency;
    this.amount = amount;
    this.currencies = currencies;
  }
}
