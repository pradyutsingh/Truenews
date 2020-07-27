import 'package:Truenews/datahelper/data.dart';
import 'package:Truenews/datahelper/news.dart';
import 'package:Truenews/main.dart';
import 'package:Truenews/model/category_data.dart';
import 'package:Truenews/model/news_model.dart';
import 'package:Truenews/widgets/blog_tile.dart';
import 'package:Truenews/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<NewsModel> articles = new List<NewsModel>();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getnews();
  }

  getnews() async {
    News newshead = News();
    await newshead.getNews();
    articles = newshead.news;
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
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey..',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Lato'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.5),
                      child: Text(
                        'Here are some headlines for you',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontFamily: 'Lato'),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          height: 80,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                url: categories[index].imgurl,
                                categoryname: categories[index].categoryName,
                              );
                            },
                            itemCount: categories.length,
                          ),
                        )
                      ],
                    ),
                    // STARTING THE ARTICLES FROM HERE
                    SizedBox(
                      height: 10,
                    ),
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
                    )),
                  ],
                ),
              ),
            ),
    );
  }
}
