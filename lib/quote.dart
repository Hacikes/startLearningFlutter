class Quote {

  String text;
  String author;

  // Используем именованные параметры в {}
  Quote({ required this.text, required this.author}){
    this.text = text;
    this.author = author;
  }


}
// И тут мы можем использовать наши именованные параметры
//Quote myquote = Quote(text: 'dfd',author: 'fdf');