import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

final _rootUrl = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    String url = '$_rootUrl/topstories.json';
    final response = await client.get(url);
    final ids = json.decode(response.body);
    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    String url = '$_rootUrl/item/$id.json';
    final response = await client.get(url);
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}