import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/colors.dart';

import 'package:food_delivery_app/models/food.dart';

class FoodQuantity extends StatelessWidget {
  final Food? food;
  const FoodQuantity({
    Key? key,
    this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 40,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-0.35, 0),
              child: Container(
                height: double.maxFinite,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '\$',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    food!.price!.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            Align(
              alignment: Alignment(0.1, 0),
              child: Container(
                height: double.maxFinite,
                width: 100,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '-',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.all(11),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Text(
                        food!.quantity!.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      '+',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
