import 'package:app_food/models/category.dart';
import 'package:flutter/material.dart';

class FoodsPage extends StatelessWidget {
  final Category category;
  FoodsPage({this.category});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Foods from ${this.category.content}'),
        ),
        body: Center(
          child: Text('this show Food\'s list', style: TextStyle(fontSize: 28)),
        ));
  }
}
