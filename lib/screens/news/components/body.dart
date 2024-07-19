import 'package:auto_mentorx/screens/news/components/test.dart';
import 'package:auto_mentorx/screens/news/components/web_view_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../models/cardnews.dart';
import '../../../size_config.dart';
import 'news_card_skelton.dart';
import 'news_header.dart';
import 'news_slider.dart';
import 'news_widget.dart';

class NewsBody extends StatefulWidget {
  const NewsBody({super.key});

  @override
  State<NewsBody> createState() => _NewsBodyState();
}

class _NewsBodyState extends State<NewsBody> {
  Dio dio = Dio();
  List<NewsCard> newsCard = [];
  bool isDataFetched = false;
  final scrollController = ScrollController();
  int page = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    getData();
  }

  Future<void> getData() async {
    final response =await dio.get('http://192.168.1.8:8080/get-data');

    List fetchData = response.data;
    fetchData.forEach((element) {
      newsCard.add(NewsCard(
          title: element['title'].toString(),
          desc: element['description'].toString(),
          path: element['path'].toString(),
          newsUrl: element['newsUrl']
      ));
    });
    newsCard.forEach((element) {

      print(element.path);
      setState(() {});
    });

    setState(() {
      isDataFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(5)),
              const NewsHeader(),
              SizedBox(height: getProportionateScreenWidth(20)),
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Automotive Ads.',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(10)),
              NewsSlider(),
              const Padding(
                padding: EdgeInsets.only(left: 25, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Latest News',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(15)),
              isDataFetched
                  ? SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                        controller: ScrollController(),
                        itemCount: isLoadingMore
                            ? newsCard.length + 1
                            : newsCard.length,
                        itemBuilder: (context, index) {
                          if (index < newsCard.length) {
                            final title = newsCard[index].title;
                            final desc = newsCard[index].desc;
                            final path = newsCard[index].path;
                            return NewsWidget(
                                title: title, desc: desc, path: path, callback: () {
                              Navigator.push(context, MaterialPageRoute(builder:(context)=>WebViewContainer(newsLink: newsCard[index].newsUrl,)));

                            },);
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    )
                  : const NewsCardSkelton(),
            ],
          ),
        ),
      ),
    );
  }

  void _scrollListener() async {
    if (isLoadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = true;
        print('end of screen');
      });
      page = page + 1;
      await newsCard;
      setState(() {
        isLoadingMore = false;
        print('=====================');
      });
    }
  }
}
// TextButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => TestScreen(),
// ));
// },
// child: Text('Press')),
// SizedBox(height: getProportionateScreenHeight(20)),