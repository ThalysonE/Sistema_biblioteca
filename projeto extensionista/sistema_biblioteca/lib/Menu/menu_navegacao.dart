import 'package:flutter/material.dart';
import 'package:sistema_biblioteca/theme.dart';

import '../Modelos/modelo_menu.dart';
import 'menu_list_tile.dart';

class MenuNavegacao extends StatefulWidget {
  const MenuNavegacao({super.key});

  @override
  State<MenuNavegacao> createState() => _MenuNavegacaoState();
}

class _MenuNavegacaoState extends State<MenuNavegacao> with SingleTickerProviderStateMixin {
  double maxwidth = 220.0;
  double minwidth = 70.0;
  bool menuAtivado = false;
  int indexAtual = 0;

  Widget build(BuildContext context){
    return AnimatedContainer(
      duration: Duration(milliseconds: 180),
      width: menuAtivado ? maxwidth : minwidth,
      child: getWidget(context,widget),
    );
  }
  Widget getWidget(context, widget){
    return Material(
      elevation: 8.0,
      child: Container(duration
          width: AnimatedContainer.value,
          color: drawerBackgroundColor,
          child: Column(
            children: <Widget>[
              MenuListTile(
                  title: "Ola ADM",
                  icon: Icons.person, 
                  animationController: _animationController,
                  onTap: (){
      
                  },
              ),
              Divider(color: Colors.grey, height: 40.0,),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context,counter){
                    return const Divider(height: 12.0,);
                  },
                
                  itemBuilder: (context,counter) {
                    return MenuListTile(
                      onTap: () {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            indexAtual = counter;
                          });
                        });
                      },
                      menuAtivado: indexAtual == counter,
                      title: menuitens[counter].title,
                      icon: menuitens[counter].icon,
                      animationController: _animationController
                    );
                  }, 
                  itemCount:menuitens.length,
                ),
              ),
              InkWell(
                onTap:(){
                  setState(() {
                    menuAtivado = !menuAtivado;
                    menuAtivado ? _animationController.forward() 
                    : _animationController.reverse();
                  });
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: Colors.black54, 
                  size:50.0
                ),
              ),
              SizedBox(height: 50.0),
            ]
          ),
        ),
    );
  }
}