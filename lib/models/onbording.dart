import 'package:flutter/cupertino.dart';

class OnBoardingCard with ChangeNotifier {
  final String tag;
  final String subtag;
  final String image;

  OnBoardingCard({
    required this.tag,
    required this.image,
    required this.subtag,
  });
}
