import 'package:flutter/material.dart';
import './widgets/NavDrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: ''),
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
      backgroundColor: HexColor("#FAFAFA"),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset('assets/images/logo_guinart.png', height: 100, width: 200, alignment: Alignment.center,),

            new Card(
              margin: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset('assets/images/icon_user.png', height: 35, width: 35, alignment: Alignment.topLeft,),
                    SizedBox(height: 5),
                    Text('Username or e-mail',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        textAlign: TextAlign.start),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(fontSize: 12)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    Image.asset('assets/images/icon_user.png', height: 35, width: 35, alignment: Alignment.topLeft,),
                    SizedBox(height: 5),
                    Text(
                      'Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      textAlign: TextAlign.start,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                       SizedBox(height: 5),
                     Text('Hide password',
                        style: TextStyle(
                            color: HexColor("#13356B"),
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                        textAlign: TextAlign.start),
                        SizedBox(height: 5),
                     Text('I forgot my password',
                        style: TextStyle(
                            color: HexColor("#13356B"),
                            fontWeight: FontWeight.normal,
                            fontSize: 12),
                        textAlign: TextAlign.end),
                    SizedBox(height: 15),
                    Container(
                      height: 40.0,
                      child: RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [HexColor("#194B9C"), HexColor("#13356B")],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 300.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
