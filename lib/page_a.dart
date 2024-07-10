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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('天からのメッセージは'),
            const Text(
              '　愛は与えて忘れなさい。',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Text('$omikujiNo'),
          ],
        ),
      ),
    );
  }
}
