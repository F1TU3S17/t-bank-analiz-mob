<<<<<<< HEAD
import 'package:flutter/material.dart';

class AnaliticPage extends StatefulWidget {
  const AnaliticPage({super.key});

  @override
  _AnaliticPageState createState() => _AnaliticPageState();
}

class _AnaliticPageState extends State<AnaliticPage> {
  DateTimeRange? _selectedDateRange;
  List<Map<String, dynamic>> _analyticsData = [];

  // Заглушка для функции отправки данных (будет заменена на реальный запрос на сервер)
  Future<void> _fetchAnalyticsData(DateTime start, DateTime end) async {
    // Заглушка: Возвращаем тестовые данные
    await Future.delayed(Duration(seconds: 1)); // эмуляция задержки
    setState(() {
      _analyticsData = [
        {
          'status': 0,
          'title': 'Высокая разница доходов и расходов',
          'info':
              'Ваши доходы существенно превышают расходы, что даёт вам почву для инвестиций.'
        },
        {
          'status': 1,
          'title': '10% вашего бюджета уходит на алкоголь',
          'info':
              'Очень много денег уходит на алкоголь. Если бы вы потратили хотя бы 5% от этой суммы на Инвест копилку, то заработали бы 321312 btc.'
        },
        {
          'status': 2,
          'title': 'Инвестиции в акции растут',
          'info':
              'Ваши инвестиции в акции показывают положительную динамику. Возможно, стоит увеличить долю в портфеле.'
        },
        {
          'status': 0,
          'title': 'Проблемы с кредитами',
          'info':
              'Ваши расходы на кредиты слишком высоки. Рассмотрите возможность рефинансирования.'
        },
      ];
    });
  }

  // Открытие выбора диапазона дат
  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: _selectedDateRange,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.yellow, // Цвет для выделения
              onPrimary:
                  Colors.black, // Цвет текста и элементов на фоне primary
              secondary: Colors.grey, // Цвет для акцентов
              onSecondary:
                  Colors.black, // Цвет текста и элементов на фоне secondary
              onSurface: Colors.white,
            ),
            scaffoldBackgroundColor:
                Colors.grey[900], // Устанавливаем фон календаря
            dialogBackgroundColor: Colors.grey[850], // Фон всплывающего окна
            dialogTheme: DialogTheme(
              backgroundColor: Colors.grey[850], // Цвет окна ручного ввода
            ),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor:
                        Colors.black)), // Используем foregroundColor
            iconTheme: IconThemeData(color: Colors.white), // Белые иконки
            textTheme: TextTheme(
              bodyLarge:
                  TextStyle(color: Colors.black), // Белый цвет для текста
              bodyMedium:
                  TextStyle(color: Colors.white), // Белый цвет для текста
              bodySmall:
                  TextStyle(color: Colors.white), // Белый цвет для субтитров
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey[800], // Цвет фона текстового поля
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.yellow, // Цвет рамки при фокусе
                  width: 2,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });

      // Вызываем функцию для получения аналитики с выбранными датами
      _fetchAnalyticsData(picked.start, picked.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      appBar: AppBar(
        title: const Text('Аналитика'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Календарь для выбора диапазона дат
            GestureDetector(
              onTap: () => _selectDateRange(context),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDateRange == null
                          ? 'Выберите диапазон дат'
                          : '${_selectedDateRange!.start.toLocal()} - ${_selectedDateRange!.end.toLocal()}',
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Список аналитики
            Expanded(
              child: ListView.builder(
                itemCount: _analyticsData.length,
                itemBuilder: (context, index) {
                  var data = _analyticsData[index];
                  Color borderColor;

                  // Выбор цвета границы на основе статуса
                  switch (data['status']) {
                    case 0:
                      borderColor = Colors.red; // Отрицательная информация
                      break;
                    case 1:
                      borderColor = Colors.yellow; // Внимание
                      break;
                    case 2:
                      borderColor = Colors.green; // Положительная информация
                      break;
                    default:
                      borderColor = Colors.grey;
                  }

                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: borderColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle_outline,
                        color: borderColor,
                      ),
                      title: Text(
                        data['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Белый цвет текста заголовка
                        ),
                      ),
                      subtitle: Text(
                        data['info'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Белый цвет текста субтитров
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

class AnaliticPage extends StatefulWidget {
  const AnaliticPage({super.key});

  @override
  _AnaliticPageState createState() => _AnaliticPageState();
}

class _AnaliticPageState extends State<AnaliticPage> {
  DateTimeRange? _selectedDateRange;
  List<Map<String, dynamic>> _analyticsData = [];

  // Заглушка для функции отправки данных (будет заменена на реальный запрос на сервер)
  Future<void> _fetchAnalyticsData(DateTime start, DateTime end) async {
    // Заглушка: Возвращаем тестовые данные
    await Future.delayed(Duration(seconds: 1)); // эмуляция задержки
    setState(() {
      _analyticsData = [
        {
          'status': 0,
          'title': 'Высокая разница доходов и расходов',
          'info':
              'Ваши доходы существенно превышают расходы, что даёт вам почву для инвестиций.'
        },
        {
          'status': 1,
          'title': '10% вашего бюджета уходит на алкоголь',
          'info':
              'Очень много денег уходит на алкоголь. Если бы вы потратили хотя бы 5% от этой суммы на Инвест копилку, то заработали бы 321312 btc.'
        },
        {
          'status': 2,
          'title': 'Инвестиции в акции растут',
          'info':
              'Ваши инвестиции в акции показывают положительную динамику. Возможно, стоит увеличить долю в портфеле.'
        },
        {
          'status': 0,
          'title': 'Проблемы с кредитами',
          'info':
              'Ваши расходы на кредиты слишком высоки. Рассмотрите возможность рефинансирования.'
        },
      ];
    });
  }

  // Открытие выбора диапазона дат
  Future<void> _selectDateRange(BuildContext context) async {
    DateTimeRange? picked = await showDateRangePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDateRange: _selectedDateRange,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.yellow, // Цвет для выделения
              onPrimary:
                  Colors.black, // Цвет текста и элементов на фоне primary
              secondary: Colors.grey, // Цвет для акцентов
              onSecondary:
                  Colors.black, // Цвет текста и элементов на фоне secondary
              onSurface: Colors.white,
            ),
            scaffoldBackgroundColor:
                Colors.grey[900], // Устанавливаем фон календаря
            dialogBackgroundColor: Colors.grey[850], // Фон всплывающего окна
            dialogTheme: DialogTheme(
              backgroundColor: Colors.grey[850], // Цвет окна ручного ввода
            ),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    foregroundColor:
                        Colors.black)), // Используем foregroundColor
            iconTheme: IconThemeData(color: Colors.white), // Белые иконки
            textTheme: TextTheme(
              bodyLarge:
                  TextStyle(color: Colors.black), // Белый цвет для текста
              bodyMedium:
                  TextStyle(color: Colors.white), // Белый цвет для текста
              bodySmall:
                  TextStyle(color: Colors.white), // Белый цвет для субтитров
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey[800], // Цвет фона текстового поля
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.yellow, // Цвет рамки при фокусе
                  width: 2,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });

      // Вызываем функцию для получения аналитики с выбранными датами
      _fetchAnalyticsData(picked.start, picked.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      appBar: AppBar(
        title: const Text('Аналитика'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            // Календарь для выбора диапазона дат
            GestureDetector(
              onTap: () => _selectDateRange(context),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDateRange == null
                          ? 'Выберите диапазон дат'
                          : '${_selectedDateRange!.start.toLocal()} - ${_selectedDateRange!.end.toLocal()}',
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Список аналитики
            Expanded(
              child: ListView.builder(
                itemCount: _analyticsData.length,
                itemBuilder: (context, index) {
                  var data = _analyticsData[index];
                  Color borderColor;

                  // Выбор цвета границы на основе статуса
                  switch (data['status']) {
                    case 0:
                      borderColor = Colors.red; // Отрицательная информация
                      break;
                    case 1:
                      borderColor = Colors.yellow; // Внимание
                      break;
                    case 2:
                      borderColor = Colors.green; // Положительная информация
                      break;
                    default:
                      borderColor = Colors.grey;
                  }

                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: borderColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle_outline,
                        color: borderColor,
                      ),
                      title: Text(
                        data['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Белый цвет текста заголовка
                        ),
                      ),
                      subtitle: Text(
                        data['info'],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white, // Белый цвет текста субтитров
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
>>>>>>> e7517c8d40d47116d6d690d1f89ea60faaa7dd77
