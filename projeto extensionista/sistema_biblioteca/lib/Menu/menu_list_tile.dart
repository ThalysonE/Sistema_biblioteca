import 'package:flutter/material.dart';
import 'package:sistema_biblioteca/theme.dart';
//teste
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
      curve: Curves.decelerate,
      width: widget.menuAtivado ? 220.0 : 70.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
          width: widget.menuAtivado ? 220.0 : 70.0,
          child: ExpansionTile(
              leading: SizedBox(
                width: 10.0,
                child: Icon(widget.icon)
              ),
              trailing: widget.menuAtivado
                ? SizedBox(
                  width: 10.0,
                  child: Icon(Icons.chevron_right),
                  )
                  :SizedBox.shrink(),
              title: widget.menuAtivado
                ? Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 13.5,
                      fontFamily: 'Nunito Sans',
                    ),
                  )
                : SizedBox.shrink(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ListTile(
                    
                    title: Text('Opção 1',style: TextStyle(fontSize: 12),),
                    onTap: (){
                      
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ListTile(
                    title: Text('Opção 2', style: TextStyle(fontSize: 12),),
                    onTap: (){
                  
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ListTile(
                    title: Text('Opção 3',style: TextStyle(fontSize: 12),),
                    onTap: (){
                  
                    },
                  ),
                )
              ],
            ),
          
    ),
    )
  );
}
}