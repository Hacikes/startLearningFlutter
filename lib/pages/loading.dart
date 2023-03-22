import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData () async {
    // Отправляем GET запрос на ресурс в кавычках
    // В переменной response будет храниться ответ
    // Запрос будет выполняться асинхронно
    Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // Декодировали JSON из строки в Map, то есть в объект и всё это мы за писываем в
    // переменную data. По другому мы не сможем вытягивать конкретные пары ключ: значение
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);

  }

  // Крч эта функция определяет метод initState и вызывается
  // в момент добавления виджета на экран
  //@override указывает, что функция переопределяет метод initState()
  @override
  void initState(){
    //Строка super.initState() вызывает родительский метод initState()
    // из базового класса State, который обычно выполняет основную
    // инициализацию состояния виджета.
    super.initState();
    // Вызываем функцию getData, которая имитирует задержку
    getData();
    print('Just Text after response');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading screen'),
    );
  }
}
