import 'package:flutter/material.dart';
import 'package:sistema_biblioteca/theme.dart';

class MenuListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool menuAtivado;
  final Function onTap;

  const MenuListTile({
    super.key,
    required this.title,
    required this.icon,
    this.menuAtivado = false,
    required this.onTap,
  });

  @override
  State<MenuListTile> createState() => _MenuListTileState();
}
class _MenuListTileState extends State<MenuListTile> {
  @override
Widget build(BuildContext context) {
  return InkWell(
    onTap: () => widget.onTap(),
    child: AnimatedContainer(
      duration: Duration(milliseconds: 180),
      curve: Curves.easeInOut,
      width: widget.menuAtivado ? 220.0 : 70.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
          width: widget.menuAtivado ? 220.0 : 70.0,
          child: ListTile(
            leading: SizedBox(
              width: 10.0, // Define uma largura fixa para o ícone
              child: Icon(
                widget.icon,
                color: Colors.black54,
              ),
            ),
            title: widget.menuAtivado
                ? Text(
                    widget.title,
                    style: widget.menuAtivado
                        ? listTitleSelectedTextStyle
                        : listTitleDefaultTextStyle,
                  )
                : null,
          ),
    ),
    )
  );
}
}