<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token); // Сохраняем токен
  print('Токен сохранен $token');
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token'); // Получаем токен
}

Future<void> clearLocalStorage() async {
  // Получаем доступ к SharedPreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Очищаем все данные
  await prefs.clear();

  print('Локальное хранилище очищено.');
}
=======
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token); // Сохраняем токен
  print('Токен сохранен $token');
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('token'); // Получаем токен
}

Future<void> clearLocalStorage() async {
  // Получаем доступ к SharedPreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Очищаем все данные
  await prefs.clear();

  print('Локальное хранилище очищено.');
}
>>>>>>> e7517c8d40d47116d6d690d1f89ea60faaa7dd77
