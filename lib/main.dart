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
        body: Row(
          // Свойство, отвечающий за выравнивание элементов по горизонтали
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // Свойство, отвечающий за выравнивание элементов по вертикали
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Hello, man"),
            TextButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                ),
                child: Text('Click me'),
            ),
            Container(
              color: Colors.cyan,
              padding: EdgeInsets.all(30.0),
              child: Text('Text inside contatiner'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton( // Кнопочка с текстом
          onPressed: () {},
          child: const Text("Click"),
          backgroundColor: Colors.red[600],
        ),
    );
  }
}
