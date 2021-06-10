// @dart=2.9
import 'package:get/get.dart';
import 'package:kalpas_test/models/news_model.dart';

class FavouritesService extends GetxService {
  List<Datum> favouritesList = [];

  void addToFavourites(Datum data) {
    if (favouritesList.map((e) => e.id).contains(data.id)) {
      return;
    }
    favouritesList.add(data);
    print(favouritesList);
  }
}
