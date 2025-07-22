import 'package:flutter/material.dart';
import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';
import 'package:workspace/generated/l10n.dart';
import 'package:workspace/presention_layer/widgets/basic_widgets/secound_header.dart';
import 'package:workspace/presention_layer/widgets/details_widgets/features_section/features_list.dart';

class FeaturesSection extends StatelessWidget {
  final List<Amenity> amenities;
  const FeaturesSection({super.key, required this.amenities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SecoundHeader(
          text: S.of(context).workSpaceFeature,
          fontSize: 14,
        ),
        FeaturesList(amenities: amenities,)
      ],
    );
  }
}
