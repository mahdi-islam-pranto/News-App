import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/services/api_services.dart';

class AllNews extends StatelessWidget {
  const AllNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        onPressed: () async {
          // const allNews =
          //     "https://newsapi.org/v2/everything?q=bitcoin&apiKey=28c791f536f0432aa0e6327dbbd97699";
          // const breakingNews =
          //     "https://newsapi.org/v2/top-headlines?country=us&apiKey=28c791f536f0432aa0e6327dbbd97699";

          // final response = await http.get(Uri.parse(allNews));
          // print(response.body);
          ApiService().getAllNews();
        },
      ),
    );
  }
}
