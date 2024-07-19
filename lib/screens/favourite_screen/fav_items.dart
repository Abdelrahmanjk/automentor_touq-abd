import 'package:auto_mentorx/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:auto_mentorx/components/product_card.dart';

class FavItems extends StatefulWidget {
  static String routeName = "/fav_items";

  const FavItems({super.key});

  @override
  State<FavItems> createState() => _FavItemsState();
}

class _FavItemsState extends State<FavItems> {
  @override
  void initState() {
    int i = 0;
    isFav.forEach((element) {
      if (element) {
        counter.add(i);
      }
      i++;
    });
    super.initState();
  }

  List<int> counter = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            'Favourite Items',
            style: TextStyle(
                fontSize: 25,
                fontFamily: 'Poppins',
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: counter.isEmpty
          ? const Center(
              child: Text("There's no fav items"),
            )
          : Column(
              children: List.generate(counter.length, (index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(demoProducts[counter[index]].title),
                      leading:
                          Image.asset(demoProducts[counter[index]].images[0]),
                      // Assuming images is a list in your ProductModel
                      subtitle: Text(
                        '${demoProducts[counter[index]].price}',
                        style: TextStyle(),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            isFav[counter[index]] = false;
                            counter.remove(index);
                          });
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Divider()
                  ],
                );
              }),
            ),
    );
  }
}
