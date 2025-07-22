import 'package:flutter/material.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/secound_header.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/work_space_images/see_all.dart';

class ImageHeader extends StatelessWidget {
  const ImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SecoundHeader(
          text: S.of(context).workSpaceImages,
          fontSize: 10,
        ),
        SeeAll()
      ],
    );
  }
}
