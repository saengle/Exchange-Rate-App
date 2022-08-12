import 'package:http/http.dart' as http;
import 'dart:convert';


class ExchangeRateApi {
  Future<List<ExchangeRate>> getExchangeRateInfo(String query) async {
    Uri url = Uri.parse(
        '');
    http.Response response = await http.get(url);
    String jsonString = response.body;
    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['realtimeArrivalList'] == null) {
      return List.empty();
    }
    List<dynamic> conversion_rates = json['conversion_rates'];
    return conversion_rates.map((e) => ExchangeRate.fromJson(e)).toList();
  }
}
