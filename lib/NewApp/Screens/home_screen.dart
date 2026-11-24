import 'package:flutter/material.dart';
import 'package:project1/NewApp/Providers/articles_provider.dart';
import 'package:project1/NewApp/Widgets/new_item.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search news...',
            suffixIcon: Icon(Icons.search),
          ),
          onSubmitted: (value) {
            context.read<ArticleProvider>().searchArticles(query: value);
          },
        ),
      ),
      body: Consumer<ArticleProvider>(
        builder: (context, value, child) {
          final data = value.dataModel?.articles;
          if (data == null) {
            value.getNews();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => NewsItem(article: data[index]),
              itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}
