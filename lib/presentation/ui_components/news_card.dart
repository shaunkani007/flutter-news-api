// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalpas_test/models/favourites_service.dart';
import 'package:kalpas_test/models/news_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
    @required this.data,
    @required this.isFavouriteCard,
  }) : super(key: key);

  final Datum data;
  final bool isFavouriteCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: Container(
          height: 130,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(
                    !isFavouriteCard ? Icons.favorite_border_outlined : Icons.favorite,
                    size: 40,
                    color: Colors.red,
                  ),
                  onPressed: () => {
                    Get.find<FavouritesService>().addToFavourites(data),
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        data.summary,
                        // style: TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        data.published,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
