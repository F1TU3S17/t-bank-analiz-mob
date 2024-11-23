import 'package:flutter/material.dart';
import 'package:hakaton4k/widgets/homePageWidgees/balanceWidget.dart';
import 'package:hakaton4k/widgets/homePageWidgees/transactionWidget.dart';

import '../../сonstants/transactions.dart';



class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Карточка профиля
          profileCard(theme: theme),
          // Карточка баланса
          BalanceWidget(theme: theme),
          // Карточка с транзакциями
          Card(
            margin: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: theme.cardColor, // Используем цвет из темы
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Последние транзакции',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 250, // Ограничение по высоте
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = transactions[index];
                          return TransactionWidget(
                            iconType: transaction['iconType'],
                            categoryName: transaction['categoryName'],
                            date: transaction['date'],
                            cost: transaction['cost'],
                            typeValue: transaction['typeValue'],
                            isExpense: transaction['isExpense'],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0, // Убираем тень у кнопки
                        ),
                        onPressed: () {
                          print('Все операции');
                        },
                        child: const Text('Детальнее'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class profileCard extends StatelessWidget {
  const profileCard({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor, // Используем цвет из темы
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.yellow,
                radius: 32,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Имя пользователя',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Уровень: Новичок',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  print('Переход в профиль');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
