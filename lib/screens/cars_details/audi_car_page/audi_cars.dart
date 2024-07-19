import 'package:auto_mentorx/manual_details/detail_manual_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/car_model.dart';
import '../../categories_pages/bikes_page.dart';

class AudiCarScreen extends LogoDetailScreen {
  AudiCarScreen({Key? key, required int logoIndex})
      : super(key: key, logoIndex: logoIndex);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: CarWidget(cars: audi,),
    );
  }
}
List<CardModel> audi = [
  CardModel(type:
  'assets/images/car_logos/audi=logo.png',
      path: [
    'assets/images/audi_a5.jpg',
    'assets/images/audi_q7.png',
    'assets/images/audi_r8.jpg',
    'assets/images/audi_tt.png'
  ], text: [
    'Audi A5 II COUPÉ 2016-08->2020-03',
    'Audi Q7 II (2004-2015)',
    'Audi R8 II (2006-2016)',
    'Audi TT RS II ROADSTER (2009 - 2010)'
  ], secondPath: [
    'assets/images/car_logos/audi_a5.png',
    'assets/images/car_logos/audi_q5.png',
    'assets/images/car_logos/audi_r8.jpg',
    'assets/images/car_logos/audi_tt.png'
  ], description :[
      'The Audi A5 Coupe (2012) is a luxury two-door car manufactured by the German automaker Audi. It offers a sleek and stylish design with a distinctive and sporty appearance. The coupe\'s exterior features an aerodynamic shape, elegant lines, and a bold front grille. Its compact size and low-slung profile contribute to improved maneuverability and handling on the road.',
      '2nd desc for audi QQ7 ',
      '3rd desc for audi R8 II ',
      '4th desc for audi TT RS'
    ],
  )
];
class CarWidget extends StatelessWidget {
  const CarWidget({
    super.key, required this.cars,
  });

  final List<CardModel> cars;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(cars[0].type,width: 130,height: 130,),
          const Divider(
            indent: 50,
            endIndent: 50,
            color: Color(0xffE87121),
          ),
          SizedBox(height: 20,),

          Expanded(
            child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
              itemCount: cars[0].path.length,

              itemBuilder: (BuildContext context,int itemIndex){
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, DetailScreen.routeName,arguments: {
                    'path': cars[0].secondPath[itemIndex],
                    'text': cars[0].text[itemIndex],
                    'description': cars[0].description[itemIndex]
                  }),
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(cars[0].path[itemIndex],
                          width: 136,
                          height: 136,
                        ),
                         //SizedBox(height: 10,),
                        Text(cars[0].text[itemIndex],
                          style: const TextStyle(
                            //fontSize: 12,
                              color: Colors.black
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// List<String> audiImages = [
//   'assets/images/audi_a5.jpg',
//   'assets/images/audi_q7.png',
//   'assets/images/audi_r8.jpg',
//   'assets/images/audi_tt.png'
//
// ];
//
// List<String> audiTexts = [
//   'Audi A5 COUPÉ (2011 - 2017)',
//   'Audi Q7 II (2004-2015)',
//   'Audi R8 II (2006-2016)',
//   'Audi TT RS II ROADSTER (2009 - 2010)'
//
// ];

