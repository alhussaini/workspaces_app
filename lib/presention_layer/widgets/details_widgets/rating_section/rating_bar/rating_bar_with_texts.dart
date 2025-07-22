import 'package:flutter/material.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/rating_section/rating_bar/rating_bar.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/rating_section/rating_bar/rating_bar_text.dart';

class RatingBarWithTexts extends StatelessWidget {
  const RatingBarWithTexts(
      {super.key,
      required this.numOfRatings,
      required this.numOfStars,
      required this.percentage});
  final String numOfRatings;
  final String numOfStars;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          RatingBarText(text: numOfStars),
          RatingBar(percentage: percentage),
          RatingBarText(text: numOfRatings),
        ],
      ),
    );
  }
}
