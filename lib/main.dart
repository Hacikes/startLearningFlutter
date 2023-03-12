import 'package:flutter/material.dart';

void main() => runApp(MaterialApp (
    // Главный экран -> Scaffold виджет
    home: Scaffold(
      // Верхний бар
      appBar: AppBar(
        title: Text("Learning Flutter"),
        // централизуем текст
        centerTitle: true,
      ),
      body: Center(
        child: Text("hello man"),
      ),
      floatingActionButton: FloatingActionButton( // Кнопочка с текстом
          onPressed: () {  },
          child: Text("Click")
      ),
    ),
  ));

