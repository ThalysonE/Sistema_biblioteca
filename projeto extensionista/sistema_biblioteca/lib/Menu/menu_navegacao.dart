import 'package:flutter/material.dart';
import 'package:sistema_biblioteca/Modelos/modelo_menu.dart';
import 'menu_list_tile.dart';
import 'package:sistema_biblioteca/theme.dart';

class MenuNavegacao extends StatefulWidget {
  @override
  _MenuNavegacaoState createState() => _MenuNavegacaoState();
}

class _MenuNavegacaoState extends State<MenuNavegacao> with SingleTickerProviderStateMixin {
  double maxwidth = 220.0;
  double minwidth = 70.0;
  bool menuAtivado = false;
  int indexAtual = 0;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 180));
  }

  void toggleMenu() {
    setState(() {
      menuAtivado = !menuAtivado;
    });
    if (menuAtivado) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Material(
    
          elevation: 8.0,
          child: Container(
            width: menuAtivado ? maxwidth : minwidth,
            color: drawerBackgroundColor,
            child: Column(
              children: <Widget>[
                Row(                 
                  mainAxisAlignment: menuAtivado?MainAxisAlignment.end:MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: toggleMenu,                   
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: menuitens.length,
                    itemBuilder: (context, index) {
                      return MenuListTile(
                        title: menuitens[index].title,
                        icon: menuitens[index].icon,
                        menuAtivado: menuAtivado,
                        onTap: () {
                          setState(() {
                            indexAtual = index;
                          });
                        },
                      );
                    },
                   
                  ),                
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}