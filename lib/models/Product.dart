import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/BC-racing-coils.png",
      "assets/images/BC_coils_1.jpg",
      "assets/images/BC_coils_2.jpg",
      "assets/images/BC_coils_3.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "BC Racing -Toyota Corolla AE86",
    price: 1.195,
    description:"The BC Racing BR Series offers the most affordable entry into coilover suspension without sacrificing performance, comfort, build quality, vehicle height, or handling. This is done by extensively testing each vehicle then refining the coilover characteristics as many times as needed to ensure the most well-balanced and affordable aftermarket suspension conceivable. ",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Nissan-LMGT4.png",
      "assets/images/LMGT4_1.jpg",
      "assets/images/LMGT4_2.jpg",
      "assets/images/LMGT4_3.jpg",

    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "NISMO LMGT4 OMORI WHEEL",
    price: 999.5,
    description: "Manufactured by RAYS Engineering, the forged lightweight LMGT4 wheel design is a true classic among NISMO Motorsports enthusiasts.Originally designed for fitment on the BNR32, BCNR33, and BNR34 GTR, this forged monoblock wheel from Rays Engineering is now available in offsets ensuring perfect fitment on nearly any modern or past Nissan/Infiniti model. The forged barrel is knurled for improved tire grip and has been redesigned using Rays' current forging process to be stronger than the original LMGT4. Concave faces are standard for all three wheel size specifications.",
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/Garrett-turbo.jpg",
      "assets/images/GBC_1.jpg",
      "assets/images/GBC_2.jpg",
      "assets/images/GBC_3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Garrett Boost | Club Line GBC22-350 44MM",
    price: 989.0,
    description: "These turbochargers feature internally wastegated turbine housings and journal bearing rotating groups. GBC stands for GARRETT BOOST | CLUB LINE. The first two numbers indicate the turbo frame size. The larger the number the larger the turbine wheel. The numbers following the dash indicate the peak potential flywheel horsepower rating. GBC22-350",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/cooler-removebg-preview.png",
      'assets/images/civic2.jpg',
      'assets/images/civic1.jpg',
      'assets/images/civic3.jpg'
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "GReddy Civic Type R Intercooler Kit(s) - FK8",
    price: 695.00,
    description: 'description',
    rating: 4.0,
  ),
];

