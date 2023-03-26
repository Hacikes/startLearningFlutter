import 'package:flutter/material.dart';
import 'package:kekaga/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // До того, пока не прошёл запрос и не появилось время будет надпись
  // Loading


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
      // После вызова времени переходим на домашний экран
      // Мы как бы заменяем один экран другим методом
      // pushReplacementNamed, заместо добавления ещё одного экрана
      // С помощью arguments можем передать переменные класса, получение из этого виджета
      // на другой экран, в нашем случае на экран Home
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': ExmplClass.location,
        'flag': ExmplClass.flag,
        'time': ExmplClass.time,
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
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
        color: Colors.white,
        size: 80.0,
        ),
      ),
    );
  }
}
