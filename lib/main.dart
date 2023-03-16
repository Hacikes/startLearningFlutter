import 'package:flutter/material.dart';

void main() => runApp(MaterialApp (
    // Вызываем экран Home
    home: Home()
  ));


// Виджет без состояния (не изменяемый)
// Используется для автоматической горячей перезагрузки,
// после внесённых изменений, а так же возвращает
// экран Home
// stless - быстрый шаблон

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      // Главный экран -> Scaffold виджет
      Scaffold(
      // Верхний бар
      appBar: AppBar(
        title: const Text("Learning Flutter"),
        // централизуем текст
        centerTitle: true,
        backgroundColor: Colors.red[600],// При нажатии ctrl + q можно посмотреть палитру цветов
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            print("You clicked me");
          },
          icon: Icon(Icons.alternate_email),
          color: Colors.amber,

        ),
      ),
      floatingActionButton: FloatingActionButton( // Кнопочка с текстом
        onPressed: () {},
        child: const Text("Click"),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
