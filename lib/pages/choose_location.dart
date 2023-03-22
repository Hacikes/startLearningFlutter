import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData () async {
    // Моделируем сетевой запрос
    // Делаем задержку, длительностью 3 сек и функцию, которая срабатывает спустя эти 3 секунды
    await Future.delayed(Duration(seconds: 3),(){
      print('Deleay 3 sec Done');
    });

    // теперь это говно заставит ждать getData, но насрёт на print в initState()
    // Моделируем сетевой запрос
    // Делаем задержку, длительностью 3 сек и функцию, которая срабатывает спустя эти 3 секунды
    String username = await Future.delayed(Duration(seconds: 4),(){
      return 'Kirill!!\n Deleay 4 sec Done';
    });

    // теперь это говно будет выполняться только по предыдущего
    // Моделируем сетевой запрос
    // Делаем задержку, длительностью 3 сек и функцию, которая срабатывает спустя эти 3 секунды
    String bio =  await Future.delayed(Duration(seconds: 2),(){
      return ' <\nбиография !\nАсихронно Deleay 2 sec Done';
    });

    // Пока обе переменные не будут возвращены, ни одна не распечается
    print('$username - $bio \nWithout deleay');
  }

  int counter = 0;

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
    // print не блокируется, а выполняется, как можно быстрее
    print("initState function ran");

  }

  @override
  Widget build(BuildContext context) {
    print("Build function ran");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter +=1;
          });
        }, child: Text('Counter is $counter'),
      ),
    );
  }
}
