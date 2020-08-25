import 'package:flutter/material.dart';
import 'package:sellout/config/theme.dart';
import 'package:sellout/screens/categories/categories_list_screen.dart';
import 'package:sellout/screens/categories/categories_tile_screen.dart';
import 'package:sellout/screens/home/one/home_screen_one.dart';
import 'package:sellout/screens/home/two/home_screen_two.dart';
import 'package:sellout/screens/products_screen.dart';
import 'package:sellout/widgets/bottom_menu.dart';
import 'package:sellout/widgets/button.dart';

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
        // '/': (context) => HomeScreenOne(),
        // '/home': (context) => HomeScreen(),
        // '/silver': (context) => SilverScreen(),
        ProductsScreen.routeName: (context) => ProductsScreen(),
        CategoriesTileScreen.routeName: (context) => CategoriesTileScreen(),
        CategoriesListScreen.routeName: (context) => CategoriesListScreen(),
        HomeScreenTwo.routeName: (context) => HomeScreenTwo(),
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
              '3 You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Button(
              onPressed: () =>
                  {Navigator.pushNamed(context, ProductsScreen.routeName)},
              title: 'ProductsScreen',
            ),
            Button(
              onPressed: () => {
                Navigator.pushNamed(context, CategoriesTileScreen.routeName)
              },
              title: 'CategoriesTileScreen',
            ),
            Button(
              onPressed: () => {
                Navigator.pushNamed(context, CategoriesListScreen.routeName)
              },
              title: 'CategoriesListScreen',
            ),
            Button(
              onPressed: () =>
                  {Navigator.pushNamed(context, HomeScreenOne.routeName)},
              title: 'HomeScreenOne',
            ),
            Button(
                onPressed: () =>
                    {Navigator.pushNamed(context, HomeScreenTwo.routeName)},
                title: 'HomeScreenTwo')
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
