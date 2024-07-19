import 'package:auto_mentorx/manual_details/detail_manual_screen.dart';
import 'package:flutter/material.dart';
import '../../../models/bike_model.dart';
import '../../categories_pages/bikes_page.dart';

class DucatiBikeScreen extends LogoDetailScreen {
  DucatiBikeScreen({Key? key, required int logoIndex})
      : super(key: key, logoIndex: logoIndex);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: BikeWidget(bike: ducati),
    );
  }
}
List<BikeModel> ducati = [
  BikeModel(type:
  'assets/images/bike_logos/ducati.png',
    path: [
      'assets/images/m3290.jpg',
      'assets/images/DUCATI-748.jpg',
      'assets/images/2017-ducati.jpg',
      'assets/images/Ducati Classic .jpg',
      'assets/images/Ducati Desert Sled .jpg'
    ], text: [
      'Ducati 600 (1994 - 2005)',
      'Ducati 748 V-Twins\n(1995 - 2001)',
      'Ducati Cafe Racer\n(2017 - 2020)',
      'Ducati Classic\n(2015 - 2019)',
      'Ducati Desert Sled\n(2017 - 2020)'
    ], secondPath: [
      'assets/images/car_logos/audi_a5.png',
      'assets/images/car_logos/audi_q5.png',
      'assets/images/car_logos/audi_r8.jpg',
      'assets/images/car_logos/audi_tt.png',
      'assets/images/car_logos/audi_tt.png',
    ], description :[
      'The Audi A5 Coupe (2012) is a luxury two-door car manufactured by the German automaker Audi. It offers a sleek and stylish design with a distinctive and sporty appearance. The coupe\'s exterior features an aerodynamic shape, elegant lines, and a bold front grille. Its compact size and low-slung profile contribute to improved maneuverability and handling on the road.',
      '2nd desc for audi QQ7 ',
      '3rd desc for audi R8 II ',
      '4th desc for audi TT RS',
      '4th desc for audi TT RS',
    ],
  )
];
class BikeWidget extends StatelessWidget {
  const BikeWidget({
    super.key, required this.bike,
  });

  final List<BikeModel> bike;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(bike[0].type,width: 130,height: 130,),
          const Divider(
            indent: 50,
            endIndent: 50,
            color: Color(0xffE87121),
          ),
          const SizedBox(height: 20,),

          Expanded(
            child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30.0,
              mainAxisSpacing: 30.0,
            ),
              itemCount: bike[0].path.length,

              itemBuilder: (BuildContext context,int itemIndex){
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, DetailScreen.routeName,arguments: {
                    'path': bike[0].secondPath[itemIndex],
                    'text': bike[0].text[itemIndex],
                    'description': bike[0].description[itemIndex]
                  }),
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(bike[0].path[itemIndex],
                          width: 136,
                          height: 136,
                        ),
                        // SizedBox(height: 10,),
                        Text(bike[0].text[itemIndex],
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


