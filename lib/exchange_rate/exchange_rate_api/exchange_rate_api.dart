import 'package:http/http.dart' as http;
import 'dart:convert';

class ExchangeRateApi {
  Future<Map<String, dynamic>> getExchangeRateInfo() async {
    Uri url = Uri.parse(
        'https://v6.exchangerate-api.com/v6/b3e959e14f604e261cc4a886/latest/USD');
    http.Response response = await http.get(url);
    String jsonString = response.body;
    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['conversion_rates'] == null) {
      return {};
    }
    Map<String, dynamic> conversionRates = json['conversion_rates'];
    return conversionRates;
  }
}
