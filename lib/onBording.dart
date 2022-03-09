import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/onbording.dart';

import 'Screens/home/home.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int selectedIndex = 0;
  PageController? _controller;

  List<OnBoardingCard> onbordingcard = [
    OnBoardingCard(
      image: 'assets/images/vector4.png',
      tag: 'Top #1 Fastest \n Delivery Food For You',
      subtag:
          'Our job is to filling your tummy with delicious food and fast delivery.',
    ),
    OnBoardingCard(
      image: 'assets/images/vector2.png',
      tag: 'Top #1 Fastest \n Delivery Food For You',
      subtag:
          'Our job is to filling your tummy with delicious food and fast delivery.',
    ),
    OnBoardingCard(
      image: 'assets/images/vector3.png',
      tag: 'Top #1 Fastest \n Delivery Food For You',
      subtag:
          'Our job is to filling your tummy with delicious food and fast delivery.',
    ),
  ];

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: onbordingcard.length,
                onPageChanged: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          margin: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 25,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(onbordingcard[index].image),
                              ))),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 10),
                        child: Text(
                          onbordingcard[index].tag,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Text(
                          onbordingcard[index].subtag,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black26),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onbordingcard.length,
              (index) => buildDot(index, context),
            ),
          ),
          Container(
            height: 55,
            margin: const EdgeInsets.fromLTRB(40, 30, 40, 80),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 15,
                      color: Colors.amber.withOpacity(0.3),
                      spreadRadius: 5,
                      offset: const Offset(0, 4))
                ]),
            child: TextButton(
              child: Text(
                selectedIndex == onbordingcard.length - 1
                    ? "Get Started"
                    : "Next",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (selectedIndex == onbordingcard.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                }
                _controller?.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
              style: TextButton.styleFrom(primary: Colors.white),
            ),
          )
        ],
      ),
    ));
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: selectedIndex == index ? 30 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selectedIndex == index ? Colors.amber : Colors.black12,
      ),
    );
  }
}
