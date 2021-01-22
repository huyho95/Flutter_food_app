import 'package:app_food/category_item.dart';
import 'package:app_food/fake_data.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  static const String routeName = "/CategoriesPage";
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(12),
      children: FAKE_CATEGORIES
          .map((eachCategory) => CategoryItem(category: eachCategory))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300, // Chiều rộng max 300
          childAspectRatio: 3 / 3, // tỉ lệ chiều rộng/ chiều cao
          crossAxisSpacing: 10, // Độ rộng giữa các lưới theo chiều ngang
          mainAxisSpacing: 10 // Độ rộng giữa các lưới theo chiều dọc
          ),
    );
  }
}
