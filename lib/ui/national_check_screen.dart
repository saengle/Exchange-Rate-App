import 'package:flutter/material.dart';

class NationalCheckScreen extends StatefulWidget {
  const NationalCheckScreen({Key? key}) : super(key: key);

  @override
  State<NationalCheckScreen> createState() => _NationalCheckScreenState();
}

class _NationalCheckScreenState extends State<NationalCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Navigator.pop(context),
        title: const Text('국가 선택하기'),
      ),
      body: ListView(
        children: [
          ListTile(
            // Row : 국기 // 국가이름, 코드 // 체크박스
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
