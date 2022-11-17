import 'dart:ffi';

class ExchangeRate {
  final num USD;
  final num KRW;
  final num EUR;
  final num CNY;
  final num JPY;
  final num GBP;

  ExchangeRate(
      {required this.KRW,
        required this.USD,
        required this.CNY,
        required this.JPY,
        required this.GBP,
        required this.EUR});

  factory ExchangeRate.fromJson(Map<String, dynamic> json) {
    return ExchangeRate(
      KRW: json['KRW'] as num,
      USD: json['USD'] as num,
      EUR: json['EUR'] as num,
      CNY: json['CNY'] as num,
      JPY: json['JPY'] as num,
      GBP: json['GBP'] as num,
    );
  }
}
