import 'package:flutter/material.dart';

void main() => runApp(MaterialApp (
    home: NinjaCard()
  ));


class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {

  // Переменные, которые будут меняться в возвращаемом виджете
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        // Задаёт общий фон
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Ninja ID Card'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          // Убирает тень на appbar
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Функция кнопки
            setState(() {
              ninjaLevel += 1;
            });
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.grey[800],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/1.jpg'),
                  radius: 40.0,
                ),
              ),
              // Разделитель
              Divider(
                height: 60.0,
                color: Colors.grey[850],
              ),
              Text(
                  'NAME',
                style: TextStyle(
                  color: Colors.grey,
                  // Интервал между буквами
                  letterSpacing: 2.0
                ),
              ),
              SizedBox(height: 10.0,), // Коробка используется для того, чтобы увеличить расстояние между виджетами
              Text(
                'Chort',
                style: TextStyle(
                    color: Colors.amberAccent[200],
                    // Интервал между буквами
                    letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30.0,),
              Text(
                'CURRENT NINJA LEVEL',
                style: TextStyle(
                    color: Colors.grey,
                    // Интервал между буквами
                    letterSpacing: 2.0
                ),
              ),
              SizedBox(height: 10.0,), // Коробка используется для того, чтобы увеличить расстояние между виджетами
              Text(
                // Использование переменной в виджете
                '$ninjaLevel',
                style: TextStyle(
                    color: Colors.amberAccent[200],
                    // Интервал между буквами
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30.0,),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  SizedBox(width: 10.0,),
                  Text(
                    'Test1234@gmail.com',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}

