// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalpas_test/models/favourites_service.dart';
import 'package:kalpas_test/models/news_model.dart';
import 'package:kalpas_test/presentation/ui_components/news_card.dart';

class FavouritesTab extends StatefulWidget {
  const FavouritesTab({Key key}) : super(key: key);

  @override
  _FavouritesTabState createState() => _FavouritesTabState();
}

class _FavouritesTabState extends State<FavouritesTab> {
  @override
  void initState() {
    favourites = Get.find<FavouritesService>().favouritesList;
    super.initState();
  }

  List<Datum> favourites;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: favourites.map((e) => NewsCard(data: e, isFavouriteCard: true,)).toList(),
      ),
    );
  }
}
