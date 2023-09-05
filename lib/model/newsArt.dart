class NewsArt {
  String imgUrl;
  String newsHead;
  String newsDesc;
  String newsCnt;
  String newsUrl;

  NewsArt(
      {required this.imgUrl,
      required this.newsHead,
      required this.newsDesc,
      required this.newsCnt,
      required this.newsUrl});

  static NewsArt fromAPItoApp(Map<String, dynamic> article) {
    return NewsArt(
      imgUrl: article["urlToImage"],
      newsHead: article["title"] ?? "--",
      newsDesc: article["description"] ?? "--",
      newsCnt: article["content"] ?? "--",
      newsUrl: article["url"] ??
          "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
    );
  }
}
