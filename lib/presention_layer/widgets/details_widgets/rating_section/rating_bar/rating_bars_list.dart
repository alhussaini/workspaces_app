import 'package:flutter/material.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/rating_section/rating_bar/rating_bar_with_texts.dart';

class RatingBarsList extends StatelessWidget {
  const RatingBarsList({super.key});
  final List<int> ratings = const [488, 74, 14, 0, 0];
  final int totalRatings = 488 + 74 + 14;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          5,
          (index) {
            double percentage =
                totalRatings > 0 ? ratings[index] / totalRatings : 0.0;
            return RatingBarWithTexts(
                percentage: percentage,
                numOfRatings: ratings[index].toString(),
                numOfStars: '${5 - index} ${S.of(context).stars}');
          },
        ),
      ],
    );
  }
}
