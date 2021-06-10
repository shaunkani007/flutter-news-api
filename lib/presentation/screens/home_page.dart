// @dart=2.9
import 'package:flutter/material.dart';
import 'package:kalpas_test/presentation/screens/favourites_tab.dart';
import 'package:kalpas_test/presentation/screens/news_tab.dart';
import 'package:kalpas_test/presentation/ui_components/bottom_nav_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool newsTabPage = true;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          // bottomNavigationBarTheme: BottomNavigationBarTheme(data: data, child: child)
          ),
      child: Scaffold(
        body: newsTabPage ? NewsTab() : FavouritesTab(),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          // color: Colors.amber,
          child: IntrinsicHeight(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: BottomNavButton(
                    isSelected: newsTabPage,
                    displayText: 'News',
                    inactiveIconColor: Colors.black,
                    icon: Icons.list,
                    onPressed: () => {
                      setState(() {
                        newsTabPage = true;
                      })
                    },
                  ),
                ),
                Container(
                  // height: 10,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFfffafa),
                    // border: Border.all(),
                  ),
                ),
                Expanded(
                  child: BottomNavButton(
                    isSelected: !newsTabPage,
                    displayText: 'Favs',
                    inactiveIconColor: Colors.red,
                    icon: Icons.favorite,
                    onPressed: () => {
                      setState(() {
                        newsTabPage = false;
                      })
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

