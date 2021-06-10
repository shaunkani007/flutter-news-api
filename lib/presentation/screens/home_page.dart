// @dart=2.9
import 'package:flutter/material.dart';
import 'package:kalpas_test/presentation/screens/favourites_tab.dart';
import 'package:kalpas_test/presentation/screens/news_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool newsTabPage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: newsTabPage ? NewsTab() : FavouritesTab(),
      bottomNavigationBar: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.ac_unit_outlined,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                newsTabPage = true;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.ac_unit_outlined,
              size: 30,
            ),
            onPressed: () {
              setState(() {
                newsTabPage = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
