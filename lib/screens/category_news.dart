import 'package:Truenews/datahelper/news.dart';
import 'package:Truenews/model/news_model.dart';
import 'package:Truenews/widgets/blog_tile.dart';
import 'package:flutter/material.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<NewsModel> articles = new List<NewsModel>();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getCategorynews();
  }

  getCategorynews() async {
    CategoryNewsClass categorynewshead = CategoryNewsClass();
    await categorynewshead.getNews(widget.category);
    articles = categorynewshead.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'True',
              style: TextStyle(color: Colors.orangeAccent),
            ),
            Text(
              'news',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child: Container(
                child: SingleChildScrollView(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                  child: Column(
                children: [
                  Container(
                      child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BlogTile(
                        title: articles[index].title,
                        url: articles[index].urlToImage,
                        description: articles[index].description,
                        pageurl: articles[index].url,
                      );
                    },
                    itemCount: articles.length,
                  ))
                ],
              )),
            ),
    );
  }
}
