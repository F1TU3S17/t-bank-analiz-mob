import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Минимальная высота
      children: [
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity, // Карточка занимает всю ширину
            height: 150, // Фиксированная высота карточки
            child: Center(
              child: Text(
                'Home page',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),
        ElevatedButton(onPressed: () => (print('клик')), child: Text('Клик'))
      ],
    );
  }
}
