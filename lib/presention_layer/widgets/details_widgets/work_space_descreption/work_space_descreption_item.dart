import 'package:flutter/material.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/work_space_descreption/work_space_descreption.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/secound_header.dart';

class WorkSpaceDescreptionItem extends StatelessWidget {
  final String description;
  const WorkSpaceDescreptionItem({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SecoundHeader(
          text: S.of(context).workSpaceDescreotion,
          fontSize: 14,
        ),
        WorkSpaceDescreption(description: description,),
      ],
    );
  }
}
