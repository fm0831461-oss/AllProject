class ArticleModel {
  final String imageUrl;
  final String title;
  final String description;
  final String author;
  final String publishedAt;
  final String content;

  ArticleModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.author,
    required this.publishedAt,
    required this.content,
  });
}

class Articles {
  List<ArticleModel> articles;
  Articles({required this.articles});
  factory Articles.fromjson(Map<String, dynamic> json) {
    final tempList = json["articles"]
        .map<ArticleModel>(
          (article) => ArticleModel(
            // imageUrl: article["imageUrl"] ?? "",
            imageUrl: article["urlToImage"] ?? "",
            title: article["title"] ?? "",
            description: article["description"] ?? "",
            author: article["author"] ?? "",
            publishedAt: article["publishedAt"] ?? "",
            content: article["content"] ?? "",
          ),
        )
        .toList();
    return Articles(articles: tempList);
  }
}
