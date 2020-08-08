import 'package:flutter/material.dart';
import '../screen/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.id, this.title, this.color);
  void selectCatogory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => selectCatogory(context),
      child: Container(
        child: Text(
          title,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.topRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
