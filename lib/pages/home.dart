import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea помогает от скрытия чёлкой и
      // прочей лабуды с форм фактором экрана
      // и он норм работает, гык
      // В прошлый раз не сделал горячуюю перезагрузку
      body: SafeArea (
          child: Column(
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    // Функция перехода на другие экраны
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text('Edit location'),
              ),
            ],
          ),
      ),
    );
  }
}