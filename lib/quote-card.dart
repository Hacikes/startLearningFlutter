// Скопировали импорт из main.dart
import 'package:flutter/material.dart';
import 'quote.dart';


class QuoteCard extends StatelessWidget {
  // Переменная
  final Quote quote;
  final VoidCallback delete;

  //Конструктор так так
  QuoteCard({required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            SizedBox(height: 8.0),
            // Кнопка удаления
            TextButton.icon(
              onPressed: delete,
              label: Text('Delete quote'),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}