import 'package:app_food/models/food.dart';
import 'package:flutter/material.dart';

class DetailFoodPage extends StatelessWidget {
  Food food;
  DetailFoodPage({this.food});
  @override
  Widget build(BuildContext context) {
    print('ingredients: ${food.ingredients}');

    return Scaffold(
        appBar: AppBar(
          title: Text('${food.name}',
              style: TextStyle(fontFamily: 'Hachi_Maru_Pop')),
        ),
        body: Column(
          children: <Widget>[
            Center(
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: food.urlImage)),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text('Ingredients',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Expanded(
                child: food.ingredients.length > 0
                    ? ListView.builder(
                        itemCount: this.food.ingredients.length,
                        itemBuilder: (context, index) {
                          String ingredient = this.food.ingredients[index];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text('${index + 1}',
                                  style: TextStyle(fontSize: 19)),
                            ),
                            title: Text(
                              ingredient,
                              style: TextStyle(fontSize: 20),
                            ),
                          );
                        },
                      )
                    : Text('Not ingredients found',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)))
          ],
        ));
  }
}
