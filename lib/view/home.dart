import 'package:flutter/material.dart';
import 'package:newsnook/controller/fetchNews.dart';
import 'package:newsnook/model/newsArt.dart';
import 'package:newsnook/view/widget/newscontainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late NewsArt newsArt;

  GetNews() async {
    newsArt = await FetchNews.fetchnews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetNews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            GetNews();
          },
          itemBuilder: (context, index) {
            return isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : NewsContainer(
                    imgUrl: newsArt.imgUrl,
                    newsCnt: newsArt.newsCnt,
                    newsHead: newsArt.newsHead,
                    newsDesc: newsArt.newsDesc,
                    newsUrl: newsArt.newsUrl);
          }),
    );
  }
}
