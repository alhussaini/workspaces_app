import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';

class WorkSpaceDescreption extends StatelessWidget {
  final String description;
  const WorkSpaceDescreption({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 2),
      child: Text(
        description,
        style: TextStyle(
            fontFamily: MyStrings.cairoFont,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: MyColors.secoundTextHeadersColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ),
    );
  }
}
