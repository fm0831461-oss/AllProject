class ArticleModel {
  final String image;
  final String title;
  final String description;
  final String publishedData;
  final String Author;
  final String Article;

  ArticleModel({
    required this.image,
    required this.title,
    required this.description,
    required this.publishedData,
    required this.Author,
    required this.Article,
  });
}

class Article {
  final List<ArticleModel> articles;

  Article({required this.articles});
  factory Article.fromJson(Map<String, dynamic> json) {
    final tempList = json["articles"]
        .map<ArticleModel>(
          (item) => ArticleModel(
            image: item["urlToImage"] ?? "",
            title: item["title"] ?? "",
            description: item["description"] ?? "",
            publishedData: item["publishedAt"] ?? "",
            Author: item["author"] ?? "",
            Article: item["content"] ?? "",
          ),
        )
        .toList();
    return Article(articles: tempList);
  }
}
