import 'package:flutter/material.dart';
import 'package:hakaton4k/sreenes/pages/analiticPage.dart';
import 'package:hakaton4k/sreenes/pages/homePage.dart';
import 'package:hakaton4k/sreenes/pages/messagesPage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  changeCurrentIndex(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('../assets/logos/t_logo.png'),
        ),
      ),
      bottomNavigationBar: appNavigationBar(),
      body: <Widget>[
        /// Home page
        HomePage(theme: theme),

        /// Analitic page
        AnaliticPage(),

        /// Messages page
        MessagesPage(theme: theme),
      ][currentPageIndex],
    );
  }

  NavigationBar appNavigationBar() {
    return NavigationBar(
      onDestinationSelected: changeCurrentIndex,
      indicatorColor: Colors.amber,
      selectedIndex: currentPageIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Главная',
        ),
        NavigationDestination(
          icon: Icon(Icons.analytics_sharp),
          label: 'Аналитика',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.messenger_sharp),
          ),
          label: 'Чат',
        ),
      ],
    );
  }
}
