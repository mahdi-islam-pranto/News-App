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

  final brekingNewsList = ApiService().getBreakingNews();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Hot News")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(brekingNewsList.toString()),
          );
        },
      ),
    );
  }
}
