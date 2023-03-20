import 'package:flutter/material.dart';
import 'quote.dart';

void main() => runApp(MaterialApp (
    home: QuoteList(),
  ));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  // Используя класс Quote, который мы добавили объявляем цитату и автора
  List<Quote> quotes = [
  Quote(text: 'Life is short. Smile while you still have teeth.', author: 'author1'),
  Quote(text: 'Live each day as if it’s your last.', author: 'author2'),
  Quote(text: 'Life is beautiful. Enjoy the ride.', author: 'author3')
  ];

   Widget quoteTemplate(quote){
     return
        // В данном случае используя виджет Card, мы создали карточки
       // с цитатами и авторами и задали им свойства
       Card(
       margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
       child: Padding(
         padding: const EdgeInsets.all(12.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
             Text(
                 quote.text,
               style: TextStyle(
                 fontSize: 18.0,
                 color: Colors.grey[900],
               ),
             ),
             SizedBox(height: 6.0),
             Text(
               quote.author,
               style: TextStyle(
                 fontSize: 14.0,
                 color: Colors.grey[900],
               ),
             ),
           ],
         ),
       ),
     );
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        // будет просматривать список данных из списка
        // по сути в скобках после map сделали функцию, которая возвращает наш список цитат
        // quote - просто имя, ни с чем не связанное, только для этой функции
        // Мы использовали функцию, написаную ваше
        children: quotes.map((quote) => quoteTemplate(quote)).toList(), // говорим, что будем просматривать список
      ),
    );
  }
}

