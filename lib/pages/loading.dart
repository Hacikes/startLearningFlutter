import 'package:flutter/material.dart';
import 'package:kekaga/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // До того, пока не прошёл запрос и не появилось время будет надпись
  // Loading
  String time = 'Loading';

  // Крч эта функция определяет метод initState и вызывается
  // в момент добавления виджета на экран
  //@override указывает, что функция переопределяет метод initState()
  @override
  void initState(){

    // Эта функция вызывает наш класс WorldTime для получения времени и делает его объект
    // В месте вызова экзмепляра класса тоже надо говорить, что функция асинхронная
    void setupWorldTime() async {

      WorldTime ExmplClass = WorldTime(location: 'Moscow', flag: 'Russian_flag.jpg', url: 'Europe/Moscow');
      // Вызываем нами написанную функцию getTime, которая лежит в классе ExmplClass
      // для получения времени
      await ExmplClass.getTime();
      print(ExmplClass.time);
      // Устанавливаем состояние
      setState(() {
        time = ExmplClass.time;
      });
    }

    //Строка super.initState() вызывает родительский метод initState()
    // из базового класса State, который обычно выполняет основную
    // инициализацию состояния виджета.
    super.initState();
    // Вызываем функцию setupWorldTime, которая загружает время
    setupWorldTime();
    print('Just Text after response');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
