// import 'package:flutter/material.dart';
// import 'package:project1/NewApp/Models/article_model.dart';
// import 'package:project1/NewApp/Screens/details_screen.dart';

// class NewsItem extends StatelessWidget {
//   final ArticleModel article;
//   const NewsItem({required this.article, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => DetailsScreen(article: article),
//         ),
//       ),
//       child: Card(
//         elevation: 5,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.network(
//               article.imageUrl,
//               errorBuilder: (context, error, stackTrace) =>
//                   Icon(Icons.broken_image),
//             ),
//             Text(article.author),
//             Text(article.title),
//             Text(article.description),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:project1/NewApp/Models/article_model.dart';
import 'package:project1/NewApp/Screens/details_screen.dart';

class NewItem extends StatelessWidget {
  final ArticleModel data;
  const NewItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(data: data)),
        );
      },
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
    );
  }
}
