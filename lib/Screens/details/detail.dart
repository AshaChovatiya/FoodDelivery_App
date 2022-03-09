import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/cart/cart.dart';
import 'package:food_delivery_app/Screens/details/widget/food_detail.dart';
import 'package:food_delivery_app/Screens/details/widget/food_image.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/models/food.dart';

class DetailPage extends StatefulWidget {
  final Food food;
  const DetailPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          leading: InkWell(
            onTap: (() => Navigator.pop(context)),
            child: Container(
                margin: EdgeInsets.all(8),
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
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: (() {}),
              child: Container(
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
                    Icons.favorite_outline,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FoodImg(
                food: widget.food,
              ),
              FoodDetail(
                food: widget.food,
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
            width: 100,
            height: 50,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              fillColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              elevation: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                  Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      widget.food.quantity!.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
