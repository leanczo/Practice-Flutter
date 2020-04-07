import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      
      child:
      new Container(
        alignment: Alignment.center,
 decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [HexColor("#FCCA37"),HexColor("#FFB100")])),
    child:
      
       ListView(
        
        padding:  const EdgeInsets.only(top: 60, bottom: 15),
        children: <Widget>[
          
          ListTile(
            
            title: Text('Nuevo pedido', textAlign: TextAlign.center,),
            onTap: () => {},
          ),
          ListTile(
            title: Text('Consulta de pedidos', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Cuenta corriente', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Lista de precios', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Autorizaciones', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Notificaciones', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            title: Text('Cerrar sesión', textAlign: TextAlign.center,),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
      ),
    );
  }
}