import 'package:flutter/material.dart';
import 'package:news_app/models/news_api.dart';
import '../components/news_item_list.dart';
import '../services/api_services.dart'; // Import API service

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  //creating an object
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService
            .getBreakingNews(), //calling the api using apiService object
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<NewsModel> articleList = snapshot.data ??
                []; //creating a list variable to store all data
            return ListView.builder(
              itemCount: articleList.length,
              itemBuilder: (context, index) {
                return NewsItemList();
              },
            );
          }
        },
      ),
    );
  }
}
