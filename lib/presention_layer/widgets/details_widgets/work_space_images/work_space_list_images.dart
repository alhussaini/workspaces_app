import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/work_space_images/work_space_image.dart';

class WorkSpaceListImages extends StatelessWidget {
  const WorkSpaceListImages({super.key});
  final List<String> images = const [
    'assets/images/d1.jpeg',
    'assets/images/d2.jpeg',
    'assets/images/d3.jpeg',
    'assets/images/d4.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return WorkSpaceImage(image: images[index]);
          }),
    );
  }
}
