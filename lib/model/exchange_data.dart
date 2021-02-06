class ExchangeData {
  List<String> currencies;
  double amount;
  double convertedAmount;
  String sourceCurrency;
  String targetCurrency;

  // ExchangeData() {
  //   this.currencies = ["ARS", "USD"];
  //   this.convertedAmount = 3;
  //   this.amount = 2;
  //   this.sourceCurrency = "ARS";
  //   this.targetCurrency = "USD";
  // }

  ExchangeData(List<String> currencies, double amount, double convertedAmount,
      String sourceCurrency, String targetCurrency) {
    this.convertedAmount = convertedAmount;
    this.sourceCurrency = sourceCurrency;
    this.targetCurrency = targetCurrency;
    this.amount = amount;
    this.currencies = currencies;
  }
}
