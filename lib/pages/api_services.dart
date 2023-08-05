import '../models/news_api.dart';

class ApiService {
  final allNews =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey=28c791f536f0432aa0e6327dbbd97699";
  final breakingNews = "";

  Future<List<NewsModel>> getAllNews() async {
    try {
      response = await get(Uri.parse(allNews));
    } catch (e) {
      throw (e);
    }
  }
}
