import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  String location; // локация для UI
  late String time; // время в локации // Late используется, т.к. его нужно проинициализировать до его использования
  String flag; // url картинки флага
  String url; // url для локации

  WorldTime({ required this.location, required this.flag, required this.url});


  // Делаем асинхронную функцию, которая не блокирует использование приложения, пока она работает
  Future <void> getTime () async {

    // обрабочик ошибок try catch
    // пытаемся выполнить запрос и если не получится, то выполняется блок catch
    try {
      // Делаем запрос на получение времени
      Response response = await get(Uri.parse('https://www.timeapi.io/api/Time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);

      // Извлекаем данные
      String dateTime = data['dateTime'];
      // Отличие во времени +03:00 типо того
      // substring выбирает только промежуток символов из того, что пришло
      String timeZone = data['timeZone'].substring(7,13);

      //String nowLocation = timeZone;

      // Создать объект даты и локации
      DateTime now = DateTime.parse(dateTime);
      //Строка ниже могла бы превратить строку, которую мы получили в число
      // Закомментил, так как нам не надо переводить переменную timeZone
      // в int, т.к. она и должна быть String
      //now = now.add(Duration(hours: int.parse(timeZone)));

      // Задаём свойство time
      time = now.toString();
    }
    // e - переменная, которая ловит ошибки и сохраняет их у себя

    catch(e){
      // В данном случае выведется ошибка в консоль
      print('ERORR: $e');
      // Устанавливаем перенной значение, дабы не выводилась всякая бурда
      // так как не удалось получить карту из ответа, мы сами обозначем,
      // чему будет равна переменная time в случае ошибки
      time = 'Не удалось получить данные о времени';
    }




  }
}


