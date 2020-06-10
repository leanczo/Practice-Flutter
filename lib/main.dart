import 'package:flutter/material.dart';
import 'ui/nav_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: ''),
      initialRoute: '/',
      routes : {
        '/' : (context) =>
      }
    );
}
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _obscureText = true;

  void stateSetter() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    _imageLogo(),
                    Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            _imageUser(),
                            SizedBox(height: 5),
                            _usernameText(),
                            _usernameEntry(),
                            SizedBox(height: 10),
                            _imageUser(),
                            SizedBox(height: 5),
                            _passwordText(),
                            TextFormField(
                              obscureText: _obscureText,
                              decoration: const InputDecoration(
                                hintMaxLines: 1,
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
                            GestureDetector(
                              onTap: stateSetter,
                              child: Text('Hide password',
                                  style: TextStyle(
                                      color: Color(0xff13356b),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12),
                                  textAlign: TextAlign.start),
                            ),
                            _forgotPasswordText(),
                            SizedBox(height: 10),
                            _loginButton(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      }),
    );
  }
}

_usernameText() {
  return Text('Username or e-mail',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
      textAlign: TextAlign.start);
}

_usernameEntry() {
  return TextFormField(
    decoration: const InputDecoration(
        hintMaxLines: 1,
        hintText: 'Enter your email',
        hintStyle: TextStyle(fontSize: 12)),
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
}

_passwordText() {
  return Text(
    'Password',
    style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
    textAlign: TextAlign.start,
  );
}

_forgotPasswordText() {
  return Text('I forgot my password',
      style: TextStyle(
          color: Color(0xff13356b),
          fontWeight: FontWeight.normal,
          fontSize: 12),
      textAlign: TextAlign.end);
}

_loginButton() {
  return Container(
    height: 40.0,
    child: RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0Xff194b9c), Color(0xff13356b)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          constraints: BoxConstraints(minHeight: 40.0),
          alignment: Alignment.center,
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );
}

_imageUser() {
  return Image.asset(
    'assets/images/icon_user.png',
    height: 35,
    width: 35,
    alignment: Alignment.topLeft,
  );
}

_imageLogo() {
  return Image.asset(
    'assets/images/logo_guinart.png',
    height: 100,
    width: 200,
    alignment: Alignment.center,
  );
}
