import 'package:flutter/material.dart';
import 'package:news_app/models/news_api.dart'; // Import your NewsModel
import 'package:news_app/services/api_services.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key});

  @override
  _AllNewsState createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<NewsModel> _newsList = []; // Store the news articles here
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchNews(); // Call the function to fetch news when the widget is initialized
  }

  Future<void> _fetchNews() async {
    setState(() {
      _isLoading = true; // Set loading state
    });

    try {
      final apiService = ApiService();
      final newsList = await apiService.getAllNews();

      setState(() {
        _newsList = newsList; // Update the news list
        _isLoading = false; // Turn off loading state
      });
    } catch (e) {
      setState(() {
        _isLoading = false; // Turn off loading state
      });
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All News'),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator()) // Show loading indicator
            : _newsList.isEmpty
                ? Center(
                    child: Text(
                        'No news found.')) // Show message when no news is available
                : ListView.builder(
                    itemCount: _newsList.length,
                    itemBuilder: (context, index) {
                      final newsItem = _newsList[index];
                      return ListTile(
                        title: Text(newsItem.title ?? 'No Title'),
                        subtitle:
                            Text(newsItem.description ?? 'No Description'),
                        onTap: () {
                          // Handle tapping on a news item if needed
                        },
                      );
                    },
                  ));
  }
}
