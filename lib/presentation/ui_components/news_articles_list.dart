// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalpas_test/API%20Services/news_api_service.dart';
import 'package:kalpas_test/models/favourites_service.dart';
import 'package:kalpas_test/models/news_model.dart';

import 'news_card.dart';

class NewsArticlesList extends StatefulWidget {
  const NewsArticlesList({
    Key key,
  }) : super(key: key);

  @override
  _NewsArticlesListState createState() => _NewsArticlesListState();
}

class _NewsArticlesListState extends State<NewsArticlesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
      future: NewsApiService().makeRequest(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Datum> dataList = snapshot.data.data;
          var x = List.generate(
            dataList.length,
            (index) => NewsCard(
              refreshMethod: () {
                setState(() {});
              },
              data: dataList.elementAt(index),
              isFavouriteCard: Get.find<FavouritesService>()
                  .favouritesList
                  .map((e) => e.id)
                  .contains(dataList.elementAt(index).id),
            ),
          );
          return ListView(children: x);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
