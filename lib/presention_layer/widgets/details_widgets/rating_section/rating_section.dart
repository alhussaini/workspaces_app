import 'package:flutter/material.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/secound_header.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/rating_section/rating_bar/rating_bars_list.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/rating_section/rating_star/rating_star_with_num.dart';

class RatingSection extends StatelessWidget {
  const RatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SecoundHeader(
          text: S.of(context).rating,
          fontSize: 14,
        ),
        RatingStarWithNum(text: '3.5', rating: 3.5),
        RatingBarsList(),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
