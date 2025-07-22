class BookingRequestBodyModel {
  final String roomId;
  final String workspaceId;
  final String startDate;
  final String endDate;
  final String startTime;
  final String endTime;
  final int people;
  final int price;

  BookingRequestBodyModel({
    required this.roomId,
    required this.workspaceId,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.people,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'room_id': roomId,
      'workspace_id': workspaceId,
      'start_date': startDate,
      'end_date': endDate,
      'start_time': startTime,
      'end_time': endTime,
      'people': people,
      'price': price,
    };
  }
}
