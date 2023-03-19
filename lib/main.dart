import 'package:flutter/material.dart';

void main() => runApp(MaterialApp (
    home: QuoteList(),
  ));

class QuoteList extends StatefulWidget {
  const QuoteList({Key? key}) : super(key: key);

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<String> quotes = [
  'Life is short. Smile while you still have teeth.',
  'Live each day as if it’s your last.',
  'Life is beautiful. Enjoy the ride.'
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
        children: quotes.map((quote) => Text(quote)).toList(), // говорим, что будем просматривать список
      ),
    );
  }
}

