import 'package:flutter/material.dart';
import 'package:sistema_biblioteca/pag_inicial.dart';



void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto'
      ),
      home: PaginaIncial(),
    );
  }
}