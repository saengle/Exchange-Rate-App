import 'package:exchange_rate/exchange_rate/exchange_rate_api/exchange_rate_api.dart';
import 'package:flutter/material.dart';

class ExchangeRateViewModel extends ChangeNotifier {
  final exchangeRateApi = ExchangeRateApi();
 saveData () {

 }
  Map<String, dynamic> conversionRate = {};

  void fetchData() async {
  conversionRate = await exchangeRateApi.getExchangeRateInfo();
    notifyListeners();
  }
}
