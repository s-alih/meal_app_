import 'package:flutter/material.dart';
import '../screen/filters_sceen.dart';

class MainDrawer extends StatelessWidget {
  Widget listTile(String title, IconData icon, Function handler) {
    return ListTile(
      onTap: handler,
      leading: Icon(
        icon,
        color: Colors.pink,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: listTile('Catogories', Icons.category, () {
                Navigator.of(context).pushReplacementNamed('/');
              })),
          SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.topLeft,
              child: listTile('Filter', Icons.settings, () {
                Navigator.of(context)
                    .pushReplacementNamed(FiltersScreen.routeName);
              }))
        ],
      ),
    );
  }
}
