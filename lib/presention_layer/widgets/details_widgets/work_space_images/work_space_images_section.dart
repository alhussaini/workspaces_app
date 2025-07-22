import 'package:flutter/material.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/work_space_images/image_header.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/work_space_images/work_space_list_images.dart';

class WorkSpaceImagesSection extends StatelessWidget {
  const WorkSpaceImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageHeader(),
        WorkSpaceListImages(),
      ],
    );
  }
}
