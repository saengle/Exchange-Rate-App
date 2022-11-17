import 'package:exchange_rate/exchange_rate/exchange_rate_api/exchange_rate_api.dart';
import 'package:exchange_rate/exchange_rate/exchange_rate_model/exchange_rate_model.dart';
import 'package:exchange_rate/exchange_rate/exchange_rate_model/exchange_rate_view_model.dart';
import 'package:exchange_rate/exchange_rate/repository/national_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

class ExchangeRateScreen extends StatefulWidget {
  const ExchangeRateScreen({Key? key}) : super(key: key);

  @override
  State<ExchangeRateScreen> createState() => _ExchangeRateScreenState();
}

class _ExchangeRateScreenState extends State<ExchangeRateScreen> {
  final exchangeRateApi = ExchangeRateApi();
  final exchangeRateViewModel = ExchangeRateViewModel();
  final test = Test();
  final Testcalculrate = testcalculrate();
  final _controller = TextEditingController();

  // @override
  // void initState() {
  //   exchangeRateViewModel.fetchData();
  //
  //   super.initState();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exchangeRateViewModel = context.watch<ExchangeRateViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('환율 앱'),
          actions: [
            IconButton(
              onPressed: () {
                test.make();
                Testcalculrate.calculate();
              },
              icon: const Icon(Icons.refresh),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(), // 정보 받아온 최근 시간 알림용
            Container(
              // 리스트뷰 담기.
              width: 500,
              height: 500,
              child: ListView(
                children: [
                  Container(
                    // 세로 줄 큰 박스 하나씩. - 국기 // 나라명, 화폐명 // 수치(환율)
                    child: Row(
                      children: [
                        SizedBox(
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/23px-Flag_of_the_United_Arab_Emirates.svg.png',
                            height: 30,
                          ),
                        ),
                        Column(
                          children: [Text('')],
                        ),

                        //환율
                        // child:
                        // Text(exchangeRateViewModel.conversionRate["USD"]),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {}, //buttonTapped,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                            // child:
                            ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [const Text('bb')],
                ),
                Column(
                  children: [const Text('cc')],
                ),
                Column(
                  children: [const Text('dd')],
                ),
              ],
            )
          ],
        ));
  }
}

class Test {
  final exchangeRateApi = ExchangeRateApi();
  final exchangeRateViewModel = ExchangeRateViewModel();

  Future make() async {
    Map<String, dynamic> asd = await exchangeRateApi.getExchangeRateInfo();
    final exchangeRate = ExchangeRate(
        KRW: asd['KRW'] as num,
        USD: asd['USD'] as num,
        CNY: asd['CNY'] as num,
        JPY: asd['JPY'] as num,
        GBP: asd['GBP'] as num,
        EUR: asd['EUR'] as num);
    ContextModel cm = ContextModel();
    Parser p = Parser();
    Expression exp = p.parse("${exchangeRate.USD} + ${exchangeRate.KRW}");
    print(exp);
    print(exp.simplify());
    print(exchangeRate.KRW + exchangeRate.USD);
  }
}

class testcalculrate {
  num USD = 1;
  num KRW = 1304.2;
  num JPY = 133.5;

  calculate() {
    print(USD + KRW);
  }
}
