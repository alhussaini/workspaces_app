import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:workspace/constants/my_colors.dart';

class RatingStars extends StatelessWidget {
  const RatingStars({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      unratedColor: Colors.grey[300],
      rating: rating,
      itemPadding: EdgeInsets.symmetric(horizontal: 4),
      itemCount: 5,
      itemSize: 40,
      itemBuilder: (context, _) {
        return Icon(
          Icons.star_rate_rounded,
          color: MyColors.bottomColor,
        );
      },
    );
  }
}
