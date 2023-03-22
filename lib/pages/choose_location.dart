import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

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
