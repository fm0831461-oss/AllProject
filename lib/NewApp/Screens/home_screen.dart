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
        backgroundColor: Colors.blueGrey,
        title: Text("News App"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          SizedBox(height: 20),

          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) {
              context.read<ArticlesProvider>().search(news: value);
            },
          ),
          SizedBox(height: 15),
          Expanded(
            child: Consumer<ArticlesProvider>(
              builder: (context, value, child) {
                final data = value.article?.articles;
                if (data == null) {
                  value.getNews();
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => NewItem(data: data[index]),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
