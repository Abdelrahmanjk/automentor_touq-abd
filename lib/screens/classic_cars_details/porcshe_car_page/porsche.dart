import 'package:auto_mentorx/manual_details/detail_manual_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/car_model.dart';
import '../../categories_pages/bikes_page.dart';

class PorscheCarScreen extends LogoDetailScreen {
  PorscheCarScreen({Key? key, required int logoIndex})
      : super(key: key, logoIndex: logoIndex);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ClassicCarWidget(cars: porsche,),
    );
  }
}
List<CardModel> porsche = [
  CardModel(type:
  'assets/images/porsche-logo-1.png',
    path: [
      'assets/images/classic_cars-logos/Porsche 911 (1965 - 1989).png',
      'assets/images/classic_cars-logos/porsche917_19.png',
      'assets/images/classic_cars-logos/2017-porsche-cayenne.png'
    ], text: [
      'Porsche 911 (1965 - 1989)',
      'Porsche 917 (1969)',
      'Porsche CAYENNE III (2010-2017)'
    ], secondPath: [
      'assets/images/classic_cars-logos/porsche911(65-89)manual.jpg',
      'assets/images/classic_cars-logos/Porsche_917_1969_manual.jpg',
      'assets/images/classic_cars-logos/cayane-manual.png'

    ], description :[
     'Chapter 1: Engine\n\nChapter 2: Fuel and exhaust systems\n\nChapter 3: Ignition system\n\nChapter 4: Clutch\n\nChapter 5: Manual and Sportomatic transmission\n\nChapter 6: Rear suspension and driveshafts\n\nChapter 7: Front suspension and steering\n\nChapter 8: Braking system, wheels and tires\n\nChapter 9: Electrical system\n\nChapter 10: Bodywork and fittings\n\nChapter 11: Supplement',
      'Porsche 917 (1969)',
      'Clear, “localised” wiring schematics for key vehicle features, with wire and component trace functionality for fast, efficient, first-time fixes.\n\nIncludes pan and zoom functionality\n\nHighlight feature to trace corresponding wires and components\n\nIncludes:\n\nAir conditioning\n\nCentral locking\n\nExterior lights\n\nHorn\n\nInstrument cluster\n\nPower windows\n\nStarting/charging\n\nSupplemental restraint system (SRS)/Airbag\n\nWash/wipe system'

    ],
  )
];
class ClassicCarWidget extends StatelessWidget {
  const ClassicCarWidget({
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


