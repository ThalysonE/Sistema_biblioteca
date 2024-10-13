import 'package:flutter/material.dart';

class MenuModelo{
  String title;
  IconData icon;

  MenuModelo(this.title, this.icon);
}

List<MenuModelo> menuitens = [
  MenuModelo("Inicio", Icons.home),
  MenuModelo("Pesquisa Exemplar",Icons.search),
  MenuModelo("Empréstimos", Icons.my_library_books_rounded),
  MenuModelo("Catalogação", Icons.menu_book_outlined),
  MenuModelo("Documentação", Icons.list_alt_sharp),
  MenuModelo("Controle de Usuários",Icons.co_present_rounded)
];