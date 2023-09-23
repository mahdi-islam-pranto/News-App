class NewsModel {
  final String title;
  final String description;
  final Map source;
  final String author;

  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsModel(
      {required this.title,
      required this.description,
      required this.author,
      required this.content,
      required this.publishedAt,
      required this.source,
      required this.url,
      required this.urlToImage});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      source: json['source'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
    );
  }
}
