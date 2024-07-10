import 'package:flutter/material.dart';

class PageA extends StatelessWidget {
  final int omikujiNo;
  const PageA({
    super.key,
    required this.omikujiNo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('おみくじNoは、$omikujiNo です'),
      ),
      body: const Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('天からのメッセージは'),
          Text('　愛は与えて忘れなさい。')
        ],
      ),
    );
  }
}
