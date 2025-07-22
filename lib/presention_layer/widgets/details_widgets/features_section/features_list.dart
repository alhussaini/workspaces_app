import 'package:flutter/material.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/features_section/feature_item.dart';

class FeaturesList extends StatelessWidget {
  const FeaturesList({super.key, required this.amenities});
  // final List<String> features = const [
  //   'باقات يوميه',
  //   'باقات يوميه',
  //   'باقات يوميه',
  //   'باقات يوميه',
  //   'باقات يوميه',
  // ];
   final List<Amenity> amenities;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: amenities.length,
          itemBuilder: (context, index) {
            return FeatureItem(text: amenities[index].name);
          }),
    );
  }
}
