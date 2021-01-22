import 'package:app_food/fake_data.dart';
import 'package:app_food/models/category.dart';
import 'package:flutter/material.dart';
import 'detail_food_page.dart';
import 'models/food.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = "/FoodsPage";
  Category category;
  FoodsPage({this.category});
  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];
    //Filter foods of from category
    List<Food> foods =
        FAKE_FOODS.where((food) => food.categoryId == this.category.id).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text('Foods from ${this.category.content}',
              style: TextStyle(fontFamily: 'Hachi_Maru_Pop')),
        ),
        body: Center(
            child: Center(
                child: foods.length > 0
                    ? ListView.builder(
                        itemCount: foods.length,
                        itemBuilder: (context, index) {
                          Food food = foods[index];
                          return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailFoodPage(food: food)));
                              },
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(20),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      clipBehavior: Clip.hardEdge,
                                      child: Center(
                                        child: FadeInImage.assetNetwork(
                                            placeholder: 'assets/images/loading.gif',
                                            image: food.urlImage),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 30,
                                      left: 30,
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.black45,
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.white, width: 2)),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.timer,
                                                  color: Colors.white, size: 25),
                                              Text(
                                                '${food.duration.inMinutes} minutes',
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                    fontFamily: 'Itim'),
                                              ),
                                            ],
                                          ))),
                                  Positioned(
                                    top: 30,
                                    right: 30,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.greenAccent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            '${food.complexity.toString().split('.').last}',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black,
                                                fontFamily: 'Itim'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 30,
                                    right: 30,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.black45,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        '${food.name}',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontFamily: 'Itim'),
                                      ),
                                    ),
                                  ),
                                ],
                              ));
                        })
                    : Text('No food found',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)))));
  }
}
