import 'package:Truenews/screens/article_view.dart';
import 'package:flutter/material.dart';

class BlogTile extends StatelessWidget {
  final String title;
  final String url;
  final String description;
  final String pageurl;
  BlogTile(
      {@required this.title,
      @required this.url,
      @required this.description,
      @required this.pageurl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ArticleView(pageurl: pageurl,)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(url)),
            Text(
              title,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18),
            ),
            Text(description,
                style: TextStyle(color: Colors.black54, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
