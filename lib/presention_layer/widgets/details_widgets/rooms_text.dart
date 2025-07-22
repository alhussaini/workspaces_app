import 'package:flutter/material.dart';
import 'package:workspace/constants/my_colors.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';

class RoomsText extends StatelessWidget {
  const RoomsText({super.key, required this.amenities});
  final List<Amenity> amenities;
  final List<String> features = const [
    "ورشة عمل",
    "غرفة تدريب",
    "غرفة اجتماعات",
    "مستقل",
    "مساحة مشتركة",
    "غرفة خاصة"
  ];
  @override
  Widget build(BuildContext context) {
    final amenitiesString = amenities.map((a) => a.name).join(' • ');
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
          spacing: 8.0, // المسافة الأفقية بين الكلمات
          runSpacing: 4.0, // المسافة العمودية عند الانتقال لسطر جديد
          children: [
            Text(
              amenitiesString,
              style: TextStyle(
                  fontFamily: MyStrings.cairoFont,
                  fontSize: 16,
                  color: MyColors.secoundTextHeadersColor,
                  fontWeight: FontWeight.w500),
            )
          ]),
    );
  }
}
