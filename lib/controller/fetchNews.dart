import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:newsnook/model/newsArt.dart';

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "hacker-news",
    "national-geographic",
    "news24",
    "new-scientist",
    "newsweek",
    "recode",
    "reuters",
    "the-next-web",
    "the-times-of-india",
    "the-washington-post",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "fortune",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];
  static Future<NewsArt> fetchnews() async {
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
    print(sourceID);
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=8f393e06663b4e0fada9e066351a0526"));

    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];

    // print(articles);
    final _Newrandom = new Random();
    var myArticle = articles[_Newrandom.nextInt(articles.length)];
    print(myArticle);

    return NewsArt.fromAPItoApp(myArticle);
  }
}
