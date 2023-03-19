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
        body: Column(
          // Выравнивание по главной оси
          mainAxisAlignment: MainAxisAlignment.end,
          // Выравнивание по поперечной оси
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Hello'),
                Text(' man'),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.cyan,
              child: Text('First container'),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.pinkAccent,
              child: Text('Second container'),
            ),
            Container(
              padding: EdgeInsets.all(40.0),
              color: Colors.amber,
              child: Text('Third container'),
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
