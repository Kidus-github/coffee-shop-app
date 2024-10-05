import 'package:coffee_shop/util/coffe_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffee_shop/util/coffee_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void coffeeSelectedType(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  final List coffeeType = [
    ['Cappuccino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false]
  ];
  final List coffee = [
    ['coffee1.jpg', 'Late', 'With Almond Milk', 10.00],
    ['coffee2.jpg', 'Late', 'With Almond Milk', 28.00],
    ['coffee3.jpg', 'Late', 'With Almond Milk', 4.00],
    ['coffee4.jpg', 'Late', 'With Almond Milk', 36.00]
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Find the best coffee for you',
                style: GoogleFonts.bebasNeue(fontSize: 56),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee..',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
                  return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeSelectedType(index);
                      });
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom: 25),
                child: ListView.builder(
                    itemCount: coffee.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CoffeTile(
                        coffeeimg: coffee[index][0],
                        coffeename: coffee[index][1],
                        coffeedisc: coffee[index][2],
                        coffeeprice: coffee[index][3].toString(),
                        onPressed: () {},
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 20),
              child: Text(
                'Special for you',
                style: GoogleFonts.bebasNeue(fontSize: 30),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
