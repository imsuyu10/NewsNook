import 'package:flutter/material.dart';
import 'package:newsnook/view/detail_view.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsUrl;
  String newsCnt;

  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsDesc,
      required this.newsHead,
      required this.newsUrl,
      required this.newsCnt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage.assetNetwork(
              placeholder: "images/news.jpg",
              image: imgUrl,
              height: 390,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsHead.length > 70
                        ? "${newsHead.substring(0, 70)}..."
                        : newsHead,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    newsDesc.length > 100
                        ? "${newsDesc.substring(0, 100)}..."
                        : newsDesc,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    newsCnt != "--"
                        ? newsCnt.length > 350
                            ? newsCnt.substring(0, 350)
                            : "${newsCnt.toString().substring(0, newsCnt.length - 15)}..."
                        : newsCnt,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                              color: const Color.fromARGB(125, 33, 149, 243))
                        ],
                        borderRadius: BorderRadius.circular(25)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailViewScreen(newsUrl: newsUrl)));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Read More >>",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
