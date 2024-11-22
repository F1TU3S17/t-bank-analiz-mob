import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          height: 400,
          width: 300,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  cursorRadius: Radius.circular(30),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Логин",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black, // Цвет обычной границы
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black, // Цвет границы при фокусе
                        width: 2.0, // Толщина границы при фокусе
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Пароль",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black, // Цвет обычной границы
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black, // Цвет границы при фокусе
                        width: 2.0, // Толщина границы при фокусе
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => print('вошёл'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  minimumSize: const Size(100, 50), // Увеличиваем размер кнопки
                ),
                child: const Text('Войти'),
              ),
              const SizedBox(height: 20), // Добавляем отступ между кнопками
              // ElevatedButton(
              //   onPressed: () => print('регистрируюсь'),
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: const Size(200, 50), // Увеличиваем размер кнопки
              //   ),
              //   child: const Text('Зарегистрироваться'),
              // ),
              InkWell(
                onTap: () => print('регистрируюсь...'), // Обработчик нажатия
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(
                    color: Colors.yellow, // Цвет текста ссылки
                    decoration: TextDecoration.underline, // Подчеркивание
                    decorationColor: Colors.yellow,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
