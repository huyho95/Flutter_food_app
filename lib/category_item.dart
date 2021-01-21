import 'package:flutter/material.dart';
import 'package:app_food/models/category.dart';
import 'foods_page.dart';

class CategoryItem extends StatelessWidget {
  //1 categoryItem - 1 category object
  Category category;
  CategoryItem({this.category});
  @override
  Widget build(BuildContext context) {
    Color _color = this.category.color;
    return InkWell(
      // Inkwell: có thể bấm onTap như button
      onTap: () {
        print('aaaaa: ${this.category.content}');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FoodsPage(category: this.category)));
      },
      splashColor: Colors.deepPurple, // bấm vào inkwell sẽ nháy sáng
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.category.content,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Itim')),
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [_color.withOpacity(0.8), _color],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
            color: _color,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
