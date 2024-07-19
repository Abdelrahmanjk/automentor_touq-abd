import 'package:auto_mentorx/models/cardnews.dart';
import 'package:auto_mentorx/screens/news/components/news_card_skelton.dart';
import 'package:auto_mentorx/screens/news/components/web_view_container.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../size_config.dart';
import '../../news/news_page.dart';

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({
    super.key,
  });

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  late final WebViewController controller;
  void initStatee(){
    super.initState();
    controller = WebViewController()
    ..loadRequest(Uri.parse('https://www.caranddriver.com/news/a45596995/mazda-cx-70-release-date/'));
  }
  
  @override
  void initState() {
    getData();
    super.initState();
  }
  List<NewsCard> newsCard = [];
  Dio dio = Dio();
  void getData()async{

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

      // print('================${element.path}======================');
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Automotive News',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  color: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, NewsScreen.routeName);
                },
                child: Text(
                  "See More",
                  style: TextStyle(color: Color(0xFFBBBBBB)),
                ),
              ),
            ],
          )
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(2, (index) {
                return newsCard.isEmpty? SizedBox()
                  :SpecialOfferCard(
                image: newsCard[index].path,
                category:
                newsCard[index].title??'',
                numOfBrands: 18,
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>WebViewContainer(newsLink: newsCard[index].newsUrl,)));
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    print(image);
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20),right: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(230),
          height: getProportionateScreenWidth(115),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(13),
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                        //TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
