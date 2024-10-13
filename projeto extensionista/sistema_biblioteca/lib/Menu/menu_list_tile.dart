

import 'package:flutter/material.dart';
import 'package:sistema_biblioteca/theme.dart';

class MenuListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool menuAtivado;
  final Function onTap;


  const MenuListTile({super.key, required this.title, required this.icon, required this.animationController, this.menuAtivado = false, required this.onTap});

  @override
  State<MenuListTile> createState() => _MenuListTileState();
}

class _MenuListTileState extends State<MenuListTile> {

  late Animation<double> widthAnimation, sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation = 
      Tween<double>(begin: 220.0, end: 70.0).animate(widget.animationController);
    sizedBoxAnimation = 
      Tween<double>(begin: 10, end: 0).animate(widget.animationController);
  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> widget.onTap(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.menuAtivado 
            ? Colors.transparent.withOpacity(0.3) 
            : Colors.transparent
        ),
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
            children: <Widget>[
                Icon(
                  widget.icon, 
                  color: widget.menuAtivado 
                    ? selectedColor 
                    : Colors.black54,
                ),
                SizedBox(width: sizedBoxAnimation.value),
                (widthAnimation.value >= 220) 
                  ? Text(widget.title, 
                    style: widget.menuAtivado 
                      ? listTitleSelectedTextStyle
                      : listTitleDefaultTextStyle)
                  : Container()
        ],),
      ),
    );
  }
}