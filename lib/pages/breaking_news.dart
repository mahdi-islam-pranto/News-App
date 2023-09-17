import 'package:flutter/material.dart';
import 'package:news_app/models/news_api.dart';

import '../services/api_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BreakingNews(),
    );
  }
}

class BreakingNews extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News Today'),
      ),
      body: FutureBuilder<List<NewsModel>>(
        future: apiService.getBreakingNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No news available.'));
          } else {
            final newsList = snapshot.data!;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final newsItem = newsList[index];
                return ListTile(
                  title: Text(newsItem.title),
                  subtitle: Text(newsItem.description),
                );
              },
            );
          }
        },
      ),
    );
  }
}
