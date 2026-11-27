import 'package:flutter/material.dart';
import 'package:project1/NewApp/Models/article_model.dart';

class DetailsScreen extends StatelessWidget {
  final ArticleModel data;
  const DetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Details News"),
        centerTitle: true,
      ),
      body: Card(
        elevation: 10,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                data.image,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image),
              ),
              Text(data.Author),
              Text(data.title),
              Text(data.description),
            ],
          ),
        ),
      ),
    );
  }
}
