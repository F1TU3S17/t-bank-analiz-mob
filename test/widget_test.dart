<<<<<<< HEAD
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
  });

  test('should save and retrieve token', () async {
    when(mockSharedPreferences.setString('token', 'your_token'))
        .thenAnswer((_) async => true);
    when(mockSharedPreferences.getString('token'))
        .thenReturn('your_token');

    // Сохранение токена
    await mockSharedPreferences.setString('token', 'your_token');

    // Получение токена
    String? token = mockSharedPreferences.getString('token');
    expect(token, 'your_token');
  });
}
=======
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
  });

  test('should save and retrieve token', () async {
    when(mockSharedPreferences.setString('token', 'your_token'))
        .thenAnswer((_) async => true);
    when(mockSharedPreferences.getString('token'))
        .thenReturn('your_token');

    // Сохранение токена
    await mockSharedPreferences.setString('token', 'your_token');

    // Получение токена
    String? token = mockSharedPreferences.getString('token');
    expect(token, 'your_token');
  });
}
>>>>>>> e7517c8d40d47116d6d690d1f89ea60faaa7dd77
