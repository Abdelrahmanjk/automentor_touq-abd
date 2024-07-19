import 'package:auto_mentorx/screens/Bikes%20details/ducati_bike_page/ducati.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';
import '../Bikes details/bmw_bike_page/bmw.dart';

class BikesPage extends StatelessWidget {
  static String routeName = "/bikes";

  const BikesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: getProportionateScreenHeight(300),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffe87121), Color(0xffee975c)],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(175, 80),
            ),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                      size: 30,
                    )),
                Text(
                  'Bike Models',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  width: 65,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Center(
            child: Container(
              height: getProportionateScreenHeight(690),
              width: getProportionateScreenWidth(350),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xFFF5F6F9)),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 50.0,
                    mainAxisSpacing: 40.0,
                  ),
                  itemCount: bikesImages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to the screen based on the index
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            switch (index) {
                              case 0:
                                return DucatiBikeScreen(logoIndex: index);
                              case 1:
                                return BmwBikeScreen(logoIndex: index);

                              default:
                                return LogoDetailScreen(logoIndex: index);
                            }
                          }),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Image.asset(bikesImages[index]),
                        ),
                      ),
                    );
                  }),
            ),
          ),
        )
      ],
    ));
  }
}

class LogoDetailScreen extends StatelessWidget {
  final int logoIndex;

  const LogoDetailScreen({Key? key, required this.logoIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String logoName = getLogoName(logoIndex);

    return Scaffold(
      appBar: AppBar(
        title: Text('$logoName Bikes',style: TextStyle(fontSize: 17,fontFamily: 'Poppins'),),
      ),
      body: Center(
        child: Text(
            'Details for $logoName bikes'), // Customize the details based on the logo
      ),
    );
  }

  // Function to get the logo name based on the index
  String getLogoName(int index) {
    switch (index) {
      case 2:
        return 'Aprilia';
      case 3:
        return 'Honda';
      case 4:
        return 'KTM';
      case 5:
        return 'Suzuki';
      case 6:
        return 'Kwasaki';
      default:
        return 'Unknown';
    }
  }
}

List<String> bikesImages = [
  'assets/images/bike_logos/ducati.png',
  'assets/images/car_logos/bmw-logo.png',
  'assets/images/bike_logos/aprilia.png',
  'assets/images/bike_logos/honda.png',
  'assets/images/bike_logos/KTM_Bike_Industries.svg.png',
  'assets/images/bike_logos/download (1).png',
  'assets/images/bike_logos/th_black_river_mark.jpg',
];
