import 'package:flutter/material.dart';
import 'package:kekaga/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;

  // Наши варианты выбора местоположения
  // Берём класс WorldTime из файла world_time.dart
  List<WorldTime> locations = [
  WorldTime(location: 'Moscow', flag: 'Russia_flag.jpg', url: 'Europe/Moscow'),
  WorldTime(location: 'Berlin', flag: 'germaniya.jpg', url: 'Europe/Berlin'),
  WorldTime(location: 'London', flag: 'English.jpg', url: 'Europe/London'),
  WorldTime(location: 'Warsaw', flag: 'Poland.jpg', url: 'Europe/Warsaw')
  ];

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
      body: ListView.builder(
          itemCount: locations.length,
          // Будет циклически просматривать список
          itemBuilder: (context, index){
            // Возвращаем список, на который можно будет жмякать
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    print(locations[index].location);
                  },
                  title: Text(locations[index].location),
                  // Загружаем изображения флагов
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
