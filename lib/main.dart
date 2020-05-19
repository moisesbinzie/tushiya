import 'package:flutter/material.dart';
import 'package:tushiya/broiler.dart';
import 'package:tushiya/hatchery.dart';
import 'package:tushiya/homePage.dart';
import 'package:tushiya/layers.dart';
import 'package:tushiya/mikolongwe.dart';
import 'package:tushiya/quail.dart';
import 'package:tushiya/turkey.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      theme: ThemeData(
        // iconTheme: Theme.of(context).primaryColor,

        //  primaryColor: Colors.white,
        //  textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),

        primarySwatch: Colors.teal,
        //  accentColor: Colors.white,
        //  fontFamily: 'Lato',
      ),
      home: HomePage(),
      title: 'tushiya ',
      routes: {
        Broiler.routeName: (ctx) => Broiler(),
        Quail.routeName: (ctx) => Quail(),
        Mikolongwe.routeName: (ctx) => Mikolongwe(),
        Layers.routeName: (ctx) => Layers(),
        Hatchery.routeName: (ctx) => Hatchery(),
        Turkey.routeName: (ctx) => Turkey(),
        // Watches.routeName: (ctx) => Watches(),
        // Apparel.routeName: (ctx) => Apparel(),
        // Cart.routeName: (ctx) => Cart(),
// NetworkingPage.routeName: (ctx) => NetworkingPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
