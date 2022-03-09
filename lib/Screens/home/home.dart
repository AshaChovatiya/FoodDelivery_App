import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/home/widget/food_list.dart';
import 'package:food_delivery_app/Screens/home/widget/food_list_view.dart';
import 'package:food_delivery_app/Screens/home/widget/restaurant_info.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../cart/cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBackground,
        elevation: 0,
        centerTitle: true,
        actions: [
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        offset: const Offset(0, 4))
                  ]),
              child: Icon(
                Icons.search_rounded,
                color: Colors.black,
              )),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RestaurantInfo(),
          FoodList(
            selected: selected,
            restaurant: restaurant,
            callback: (int index) {
              setState(() {
                selected = index;
              });
              pageController.jumpToPage(index);
            },
          ),
          Expanded(
              child: FoodListView(
            selected: selected,
            callback: (int index) {
              setState(() {
                selected = index;
              });
            },
            pageController: pageController,
            restaurant: restaurant,
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 50,
            child: SmoothPageIndicator(
              controller: pageController,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
                  color: kBackground,
                  borderRadius: BorderRadius.circular(10),
                  dotBorder: DotBorder(
                    color: kPrimaryColor,
                    padding: 2,
                    width: 2,
                  ),
                ),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartScreen()));
        },
        elevation: 2,
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
