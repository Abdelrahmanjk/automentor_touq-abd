import 'package:auto_mentorx/size_config.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  static String routeName = "/about_us";

  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                  height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/About us page-cuate.png',),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(15),),
               const Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
          
                   Text(
                     'Our Story',
                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xFFE87121)),
                   ),
                 ],
               ),
              SizedBox(height: getProportionateScreenHeight(15),),
              const Text('At Auto Mintor, we are passionate about empowering every car enthusiast with the knowledge they need to maintain, repair, and enhance their vehicles. Whether you\'re a classic car aficionado, a motorcycle rider, or someone who simply wants to understand their car better, we\'ve got you covered.\n\nFounded in 2023, our journey began with a vision to create a platform that not only provides comprehensive car manuals for a vast range of vehicles but also offers a curated selection of top-quality car parts. We believe that a well-informed and equipped community contributes to a safer and more enjoyable driving experience.'),
              SizedBox(height: getProportionateScreenHeight(25),),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'What Sets Us Apart',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xFFE87121)),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Extensive Manuals Library:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFFE87121)),
                  ),
                ],
              ),
              const Text('Explore our vast collection of manuals covering cars, bikes, classic cars, and more. From maintenance guides to in-depth repair manuals, we strive to be the go-to resource for automotive knowledge.'),
              SizedBox(height: getProportionateScreenHeight(15),),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Premium Car Parts:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFFE87121)),
                  ),
                ],
              ),
              const Text('In addition to manuals, we offer a carefully curated selection of car parts to ensure that your vehicle not only runs smoothly but also stands out with enhanced performance and style. Quality is our priority, and we source products from trusted manufacturers.'),
              SizedBox(height: getProportionateScreenHeight(15),),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Passionate Team:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color(0xFFE87121)),
                  ),
                ],
              ),
              const Text('Behind Auto Mintor is a team of automotive enthusiasts who share a deep love for cars and bikes. Our experts are dedicated to providing you with the best resources and products, and we are always here to assist you on your automotive journey.'),
              SizedBox(height: getProportionateScreenHeight(25),),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Our Mission',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Color(0xFFE87121)),
                  ),
                ],
              ),
              const Text('At Auto Mintor, our mission is to democratize access to automotive expertise. We aim to be the one-stop destination where car enthusiasts, mechanics, and DIYers alike can find the information and parts they need to keep their vehicles in top-notch condition.'),
              SizedBox(height: getProportionateScreenHeight(25),),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Join Us on the Road Ahead',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xFFE87121)),
                  ),
                ],
              ),
              const Text('Whether you\'re a seasoned mechanic or just starting your journey into the world of cars, we invite you to join our community. Together, let\'s navigate the road to automotive excellence.\n\nThank you for choosing Auto Mintor X. Drive on!'),
              SizedBox(height: getProportionateScreenHeight(25),),
            ],
          ),
        ),
      ),
    );
  }
}
