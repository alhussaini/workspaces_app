import 'package:workspace/data_layer/models/workspace_models/workspace_response_model.dart';

class CoupounModel {
  final String id;
  final int hours;
  final int expiresAt;
  final double price;
  final String workspaceId;
  final String workspaceName;
  final String? directory;
   final List<Amenity> workspaceAmenities;

  CoupounModel({
    required this.id,
    required this.hours,
    required this.expiresAt,
    required this.price,
    required this.workspaceId,
    required this.workspaceName,
    required this.workspaceAmenities,
    this.directory,
  });
}