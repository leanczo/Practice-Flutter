import 'package:flutter/material.dart';
import './widgets/NavDrawer.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: MyHomePage(title: 'Snacko version Manaos'),
    );
  }
}

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              height: 130,
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15, bottom: 15),
              color: HexColor("#FFB100"),
              child: Image.asset('assets/images/logo_snacko_small.png', height: 10, width: 10),
            ),
             new Container(
              height: 50,
              alignment: Alignment.center,
              color: HexColor("#FCCA37"),
              child: Text('JVR SRL', style: TextStyle(color: Colors.black), textAlign: TextAlign.center,),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
              child: FlatButton(
                onPressed: () {},
                highlightColor: Colors.orange,
                child: Text('Nuevo pedido', style: TextStyle(color: Colors.black)),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color:  HexColor("#FCCA37"), width: 1.5, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
              child: FlatButton(
                onPressed: () {},
                  highlightColor: Colors.orange,
                child: Text('Consulta de pedidos', style: TextStyle(color: Colors.black)),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color:  HexColor("#FCCA37"), width: 1.5, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
              child: FlatButton(
                onPressed: () {},
                  highlightColor: Colors.orange,
                child: Text('Cuenta corriente', style: TextStyle(color: Colors.black)),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color:  HexColor("#FCCA37"), width: 1.5, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
              child: FlatButton(
                onPressed: () {},
                  highlightColor: Colors.orange,
                child: Text('Lista de precios', style: TextStyle(color: Colors.black)),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color:  HexColor("#FCCA37"), width: 1.5, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
              child: FlatButton(
                onPressed: () {},
                  highlightColor: Colors.orange,
                child: Text('Autorizaciones', style: TextStyle(color: Colors.black)),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: HexColor("#FCCA37"), width: 1.5, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
              child: FlatButton(
                onPressed: () {},
                  highlightColor: Colors.orange,
                child: Text('Notificaciones', style: TextStyle(color: Colors.black)),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: HexColor("#FCCA37"), width: 1.5, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
