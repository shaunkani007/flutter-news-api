// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalpas_test/models/favourites_service.dart';
import 'package:kalpas_test/models/news_model.dart';

class NewsCard extends StatefulWidget {
  NewsCard({
    Key key,
    @required this.data,
    @required this.isFavouriteCard,
    @required this.refreshMethod,
  }) : super(key: key);

  final Datum data;
  bool isFavouriteCard;
  Function refreshMethod;

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
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
                    !widget.isFavouriteCard
                        ? Icons.favorite_border_outlined
                        : Icons.favorite,
                    size: 40,
                    color: Colors.red,
                  ),
                  onPressed: () => {
                    if (widget.isFavouriteCard)
                      {
                        widget.refreshMethod(),
                        setState(() {
                          widget.isFavouriteCard = false;
                          Get.find<FavouritesService>()
                              .removeFromFavourites(widget.data);
                        })
                      }
                    else
                      {
                        widget.refreshMethod(),
                        setState(
                          () {
                            widget.isFavouriteCard = true;
                            Get.find<FavouritesService>()
                                .addToFavourites(widget.data);
                          },
                        ),
                      },
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
                        widget.data.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        widget.data.summary,
                        // style: TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        widget.data.published,
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
