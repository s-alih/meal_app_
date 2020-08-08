import 'package:flutter/material.dart';
import '../screen/meal_detail_screen.dart';

import 'package:meal_app/model/meal.dart';
//import '../dummy_data.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgeUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imgeUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });
  String complexityItem() {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unknown';
    }
  }

  String affordableItem() {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((result) {
      if (result != null) {
        //remove(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imgeUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 19,
                  child: Container(
                      width: 220,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      )),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityItem())
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordableItem())
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
