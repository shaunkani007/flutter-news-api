// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalpas_test/models/favourites_service.dart';
import 'package:kalpas_test/presentation/ui_components/news_articles_list.dart';

class NewsTab extends StatelessWidget {
  NewsTab({
    Key key,
  }) : super(key: key);

  final favoritesController = Get.put(FavouritesService());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NewsArticlesList(),
    );
  }
}
