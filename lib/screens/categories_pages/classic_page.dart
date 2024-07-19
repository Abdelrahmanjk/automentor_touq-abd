import 'package:flutter/material.dart';
import '../../size_config.dart';
import '../classic_cars_details/porcshe_car_page/porsche.dart';

class ClassicCarsPage extends StatelessWidget {
  static String routeName = "/classic_cars";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
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
                'Classic Car Models',
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
              itemCount: classicCarsImages.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the screen based on the index
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        switch (index) {
                          case 0:
                            return PorscheCarScreen(logoIndex: index);
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
                      padding: const EdgeInsets.all(15),
                      child: Image.asset(classicCarsImages[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ]));
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
        title: Text('$logoName Classic',style: TextStyle(fontSize: 17,fontFamily: 'Poppins'),),
      ),
      body: Center(
        child: Text(
            'Currently There\'s No Manuals\n for $logoName Cars',textAlign: TextAlign.center,), // Customize the details based on the logo
      ),
    );
  }

  // Function to get the logo name based on the index
  String getLogoName(int index) {
    switch (index) {
      case 1:
        return 'Cadillac';
      case 2:
        return 'Ford';
      case 3:
        return 'Pontiac';
      case 4:
        return 'Toyota';
      case 5:
        return 'Chevrolet';
      default:
        return 'Unknown';
    }
  }
}

List<String> classicCarsImages = [
  'assets/images/classic_cars-logos/Porsche-Logo.png',
  'assets/images/classic_cars-logos/Cadillac-Logo.png',
  'assets/images/classic_cars-logos/Ford-Logo-1917.jpg',
  'assets/images/classic_cars-logos/Pontiac-Lоgo.png',
  'assets/images/classic_cars-logos/toyota-logo.png',
  'assets/images/classic_cars-logos/Chevrolet-logo.png',
];
