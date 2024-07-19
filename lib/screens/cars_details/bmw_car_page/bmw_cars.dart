import 'package:auto_mentorx/manual_details/detail_manual_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/car_model.dart';
import '../../categories_pages/bikes_page.dart';

class BmwCarScreen extends LogoDetailScreen {
  BmwCarScreen({Key? key, required int logoIndex})
      : super(key: key, logoIndex: logoIndex);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: CarWidget(cars: bmw,),
    );
  }
}
List<CardModel> bmw = [
  CardModel(type:
  'assets/images/car_logos/bmw-logo.png',
    path: [
      'assets/images/bmw_e30.jpg',
      'assets/images/bmw_e36.png',
      'assets/images/bmw_e46.jpg'
    ], text: [
      'BMW E30 (1991 - 1999)',
      'BMW E36 (1995 - 1999)',
      'BMW E46 (1998 - 2006)',
    ], secondPath: [
      'assets/images/bmw_e30_manual2.jpg',
      'assets/images/bmw_e36_manual.jpg',
      'assets/images/bmw_e46_manual.jpg',
    ], description :[
      'Inside this manual you will find routine maintenance, tune-up procedures, engine repair,\ncooling and heating, air conditioning, fuel and exhaust, emissions control, ignition, brakes, suspension and steering, electrical systems, and wiring diagrams.',
      'Contents General Information\n\nChapter 1: Routine maintenance and servicing\n\nChapter 2: Part A: 4-cylinder engine in-car repair procedures\n\nChapter 2: Part B: 6-cylinder engine in-car repair procedures\n\nChapter 2: Part C: General engine overhaul procedures\n\nChapter 3: Cooling, heating and ventilation systems\n\nChapter 4: Part A: 4-cylinder engine fuel and exhaust systems\n\nChapter 4: Part B: 6-cylinder engine fuel and exhaust systems\n\nChapter 4: Part C: Emission control systems\n\nChapter 5: Part A: Starting and charging systems\n\nChapter 5: Part B: Ignition system\n\nChapter 6: Clutch Chapter\n\n7: Part A: Manual transmission\n\nChapter 7: Part B: Automatic transmission\n\nChapter 8: Final drive, driveshafts and propeller shaft\n\nChapter 9: Braking system\n\nChapter 10: Suspension and steering systems\n\nChapter 11: Bodywork and fittings\n\nChapter 12: Body electrical systems Wiring diagrams Reference',
      'Chapter 1: Routine maintenance and servicing\n\nChapter 2: Part A: 4-cylinder engine in-car repair procedures\n\nChapter 2: Part B: 6-cylinder engine in-car repair procedures\n\nChapter 2: Part C: General engine overhaul procedures\n\nChapter 3: Cooling, heating and ventilation systems\n\nChapter 4: Part A: Fuel and exhaust systems\n\nChapter 4: Part B: Emission control systems\n\nChapter 5: Part A: Starting and charging systems\n\nChapter 5: Part B: Ignition system\n\nChapter 6: Clutch\n\nChapter 7: Part A: Manual transmission\n\nChapter 7: Part B: Automatic transmission\n\nChapter 8: Final drive, driveshafts and propeller shaft\n\nChapter 9: Braking system\n\nChapter 10: Suspension and steering systems\n\nChapter 11: Bodywork and fittings\n\nChapter 12: Body electrical systems, Wiring diagrams, Reference'
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
                        // SizedBox(height: 10,),
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
List<String> bmwImages = [
  'assets/images/bmw_e30.jpg',
  'assets/images/bmw_e36.png',
  'assets/images/bmw_e46.jpg'
];

List<String> bmwTexts = [
  'BMW E30 \n (1991 - 1999)',
  'BMW E36 \n (1995 - 1999)',
  'BMW E46 \n (1998 - 2006)',
];

