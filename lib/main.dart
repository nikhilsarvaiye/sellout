import 'package:flutter/material.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/screens/home/one/home_screen_one.dart';
import 'package:sellout/widgets/bottom_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sellout',
      initialRoute: HomeScreenOne.routeName,
      routes: {
        // '/': (context) => WelcomeScreen(),
        // '/home': (context) => HomeScreen(),
        // '/silver': (context) => SilverScreen(),
        HomeScreenOne.routeName: (context) => HomeScreenOne(),
      },
      theme: AppTheme.of(context),
      home: MyHomePage(title: 'sellout Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    Navigator.pushNamed(context, HomeScreenOne.routeName);
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomMenu(1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '2 You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
