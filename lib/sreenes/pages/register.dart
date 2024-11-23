import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Убираем все нецифровые символы
    String text = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Форматируем текст
    if (text.length > 3 && text.length <= 6) {
      text = '${text.substring(0, 3)} ${text.substring(3)}';
    } else if (text.length > 6 && text.length <= 8) {
      text =
          '${text.substring(0, 3)} ${text.substring(3, 6)}-${text.substring(6)}';
    } else if (text.length > 8 && text.length <= 10) {
      text =
          '${text.substring(0, 3)} ${text.substring(3, 6)}-${text.substring(6, 8)}-${text.substring(8)}';
    } else if (text.length > 10) {
      text =
          '${text.substring(0, 3)} ${text.substring(3, 6)}-${text.substring(6, 8)}-${text.substring(8, 10)}';
    }

    // Возвращаем новый форматированный текст
    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _emailController = TextEditingController();
  String? _emailError;
  // Переменная для хранения состояния галочки (согласие)
  bool _isChecked = false;

  // Функция для изменения состояния галочки
  void _onChanged(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  bool _validateEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  void _onRegister() {
    if (_emailController.text.isEmpty ||
        !_validateEmail(_emailController.text)) {
      setState(() {
        _emailError = 'Введите корректный Email';
      });
      return;
    }

    setState(() {
      _emailError = null; // Убираем ошибку, если Email корректный
    });

    print('Зарегистрировались! Email: ${_emailController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          height: 700,
          width: 300,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  cursorRadius: const Radius.circular(30),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Логин",
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  cursorColor: Colors.black,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Пароль",
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _emailController,
                  cursorRadius: const Radius.circular(30),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Email",
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    errorText: _emailError,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    PhoneFormatter(),
                  ],
                  cursorRadius: const Radius.circular(30),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[850],
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Телефон",
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    prefixText: '+7 ',
                    prefixStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                value: _isChecked, // Состояние галочки
                onChanged: _onChanged, // Функция, меняющая состояние
                title: const Text(
                  'Я согласен на обработку персональных данных',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                controlAffinity:
                    ListTileControlAffinity.leading, // Галочка слева
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isChecked
                    ? () {
                        _onRegister;
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  minimumSize: const Size(100, 50),
                ),
                child: const Text('Зарегистрироваться'),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () => print('вхожу...'),
                child: const Text(
                  'Войти',
                  style: TextStyle(
                    color: Colors.yellow,
                    decoration: TextDecoration.underline,
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
