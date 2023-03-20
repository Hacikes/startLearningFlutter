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
        // чтобы использовать переменную, необходимо делать вот так ('${quote.text}')
        children: quotes.map((quote) => Text('${quote.text} - ${quote.author}')).toList(), // говорим, что будем просматривать список
      ),
    );
  }
}

