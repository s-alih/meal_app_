import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widget/meal_item.dart';

class FavoratiesScreen extends StatelessWidget {
  final List<Meal> favorateMeal;
  FavoratiesScreen(this.favorateMeal);
  @override
  Widget build(BuildContext context) {
    if (favorateMeal.isEmpty) {
      return Center(
        child: Text('You dont have favorates  yet!!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favorateMeal[index].id,
            title: favorateMeal[index].title,
            imgeUrl: favorateMeal[index].imageUrl,
            duration: favorateMeal[index].duration,
            affordability: favorateMeal[index].affordability,
            complexity: favorateMeal[index].complexity,
          );
        },
        itemCount: favorateMeal.length,
      );
    }
  }
}
