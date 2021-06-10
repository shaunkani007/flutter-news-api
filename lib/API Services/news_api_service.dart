// @dart=2.9
import 'package:http/http.dart' as http;
import 'package:kalpas_test/models/news_model.dart';
import 'dart:convert';

class NewsApiService {
  Future<NewsModel> makeRequest() async {
    var client = http.Client();
    var newsModel = null;
    try {
      var url = Uri.parse('https://api.first.org/data/v1/news');
      // print('Parsing');
      var response = await client.get(url);
      if (response.statusCode == 200) {
        // print('Good');
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
      return newsModel;
    } catch (e) {
      return newsModel;
    } finally {
      client.close();
    }
  }
}
