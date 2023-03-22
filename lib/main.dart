import 'package:flutter/material.dart';
import 'package:kekaga/pages/choose_location.dart';
import 'package:kekaga/pages/home.dart';
import 'package:kekaga/pages/loading.dart';

void main() => runApp(MaterialApp (
  // Первый экран
  initialRoute: '/',
  routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
  },
  ));


