import 'package:flutter/material.dart';
import '../model/meal.dart';
import '../widget/main_drawer.dart';
import './category_screen.dart';
import './favoraties_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favorateMeal;
  TabsScreen(this.favorateMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _page;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _page = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavoratiesScreen(widget.favorateMeal), 'title': 'Favoraties'}
    ];
    super.initState();
  }

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  void printName(){

    print('salippu');
    print('onji');
    print("bapputty");

    print("future millionaires");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedPageIndex]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _page[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                title: Text('categories')),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                title: Text('Favoraties')),
          ]),
    );
  }
}
