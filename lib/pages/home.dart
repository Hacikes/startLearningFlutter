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

    // С помощью этой штуки полуаем информацию о маршруте наших переменных из класса
    // WorldTime c экрана choose_location, места, которое выделено
    // *************************************
    // Делаем проверку, чтобы данные не были пустыми при обновлении данных
    // если данные не пусты, то мы берём их из нашего состояния из списка true
    // если пусты, то возвращаем исходные данные false
    data = data.isNotEmpty ? data :ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    print(data);

    // Устанавливаем фон
    // Если true, то день, если false, то ночь
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    // С тем же условием, что и выше задали цвет фона, дабы верхняя полоса подходила по цвету
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];


    return Scaffold(
      backgroundColor: bgColor,
      // SafeArea помогает от скрытия чёлкой и
      // прочей лабуды с форм фактором экрана
      // и он норм работает, гык
      // В прошлый раз не сделал горячуюю перезагрузку
      body: SafeArea (
        // Контейнер с фоном
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                // Говорим, что изображение будет занимать весь экран
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () async {
                        // Функция перехода на другие экраны
                        // в общем в result будет сохранятся список с локациями
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        // Устанавливаем маппинг того, что обновится из списка, который сохранён в result
                        // обновляем данные по сути
                        setState(() {
                          data = {
                            'time': result["time"],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag'],
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[300],
                      ),
                      label: Text(
                        'Edit location',
                        style: TextStyle(
                          color: Colors.grey[300]
                        ),
                      ),
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
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,),
                  Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
