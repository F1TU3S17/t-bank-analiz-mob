import 'package:flutter/material.dart';

class AnaliticPage extends StatelessWidget {
  const AnaliticPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const ListTile(
              leading: Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              ),
              title: Text('Высокая разница дозодов и расходов'),
              subtitle: Text('Ваши доходы существенно превышают рассходы, что дает вам почву для инвестиций'),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const ListTile(
              leading: Icon(
                Icons.check_circle_outline,
                color: Colors.red,
              ),
              title: Text('10% вашего бюджета уходит на алакоголь'),
              subtitle: Text('Очень много денег уходит на алкоголь. Если бы вы потратили хотя бы 5% от этой суммы на Инвест копилку, то заработали бы 321312 btc'),
            ),
          ),
        ],
      ),
    );
  }
}