import 'package:app_food/foods_page.dart';
import 'package:flutter/material.dart';
import 'package:app_food/categories_page.dart';

void main() => runApp(AppFood());

class AppFood extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App with Navigation',
      initialRoute: '/',
      routes: {
        '/CategoriesPage': (context) => CategoriesPage(),
        '/FoodsPage': (context) => FoodsPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.brown,
        fontFamily: 'Itim',
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Food\'s categories',
              style: TextStyle(fontFamily: 'Hachi_Maru_Pop', color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: CategoriesPage(),
          )),
    );
  }
}
