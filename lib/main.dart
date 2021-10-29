import 'package:flutter/material.dart';
import 'package:stock_app/widgets/Home_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "stockApp",
      home: Homepage(),
      theme: ThemeData(
        fontFamily: "Gilroy",
        accentColor: Colors.white,
      ),
    );
  }
}
