import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime () async {
    // Делаем запрос на получение времени
    Response response = await get(Uri.parse('https://www.timeapi.io/api/Time/current/zone?timeZone=Europe/Moscow'));
    Map data = jsonDecode(response.body);
    //print(data);

    // Извлекаем данные
    String dateTime = data['dateTime'];
    // Отличие во времени +03:00 типо того
    // substring выбирает только промежуток символов из того, что пришло
    String timeZone = data['timeZone'].substring(7,13);
    //print(dateTime);
    //print(timeZone);

    // Создать объект даты и локации
    DateTime now = DateTime.parse(dateTime);
    //Строка ниже могла бы превратить строку, которую мы получили в число
    // Закомментил, так как нам не надо переводить переменную timeZone
    // в int, т.к. она и должна быть String
    //now = now.add(Duration(hours: int.parse(timeZone)));
    //print(now);
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
    getTime();
    print('Just Text after response');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading screen'),
    );
  }
}
