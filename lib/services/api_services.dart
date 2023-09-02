import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/news_api.dart';

class ApiService {
  final allNews =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=28c791f536f0432aa0e6327dbbd97699";
  final breakingNews =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=28c791f536f0432aa0e6327dbbd97699";

  // calling getAllNews Api function
  Future<List<NewsModel>> getAllNews() async {
    try {
      // calling the api and store the data to response
      final response = await http.get(Uri.parse(allNews));

      if (response.statusCode == 200) {
        //if data is found, then json decode the response
        Map<String, dynamic> json = jsonDecode(response.body);
        // catching only articles data from the json
        List<dynamic> body = json['articles'];
        // print(body);
        // matching the article data with the NewsModel model
        List<NewsModel> articleList =
            body.map((item) => NewsModel.fromJson(item)).toList();

        return articleList; //return articleList as a list
      } else {
        throw ("No News Found");
      }
    } catch (e) {
      throw (e);
    }
  }

  // calling getBreakingNews Api function
  Future<List<NewsModel>> getBreakingNews() async {
    try {
      // calling the api and store the data to response
      final response = await http.get(Uri.parse(breakingNews));
      if (response.statusCode == 200) {
        //if data is found, then json decode the response
        Map<String, dynamic> json = jsonDecode(response.body);
        // catching only articles data from the json
        List<dynamic> body = json['articles'];
        // matching the article data with the NewsModel model
        List<NewsModel> articleList =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articleList; //return articleList as a list
      } else {
        throw ("No News Found");
      }
    } catch (e) {
      throw (e);
    }
  }
}
