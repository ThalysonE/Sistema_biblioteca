import 'package:flutter/material.dart';
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
                IconButton(
                  icon: Icon(menuAtivado ? Icons.arrow_back : Icons.menu),
                  onPressed: toggleMenu,
                ),
                SizedBox(
                  height: 60.0,
                  child: MenuListTile(
                    title: 'Página Inicial',
                    icon: Icons.home,
                    menuAtivado: menuAtivado,
                    onTap: () {
                      setState(() {
                        indexAtual = 0;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 60.0,
                  child: MenuListTile(
                    title: 'Configurações',
                    icon: Icons.settings,
                    menuAtivado: menuAtivado,
                    onTap: () {
                      setState(() {
                        indexAtual = 1;
                      });
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
