import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Делаем пустую карту для дальнейшего заполнения инфой о времени
  Map<dynamic,dynamic> data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    print(data);


    return Scaffold(
      // SafeArea помогает от скрытия чёлкой и
      // прочей лабуды с форм фактором экрана
      // и он норм работает, гык
      // В прошлый раз не сделал горячуюю перезагрузку
      body: SafeArea (
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      // Функция перехода на другие экраны
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit location'),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontSize: 66.0
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
