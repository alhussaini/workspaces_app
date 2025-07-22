import 'package:flutter/material.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/rating_section/rating_star/rating_num.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/rating_section/rating_star/rating_stars.dart';

class RatingStarWithNum extends StatelessWidget {
  const RatingStarWithNum(
      {super.key, required this.text, required this.rating});
  final String text;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 64, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [RatingNum(text: text), RatingStars(rating: rating)],
      ),
    );
  }
}
