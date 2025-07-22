class BookingResponseModel {
  final bool success;
  final BookingModel booking;
  final dynamic notificationResults;

  BookingResponseModel({
    required this.success,
    required this.booking,
    this.notificationResults,
  });

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
    return BookingResponseModel(
      success: json['success'],
      booking: BookingModel.fromJson(json['booking']),
      notificationResults: json['notification_results'],
    );
  }

}

class BookingModel {
  final String roomID;
  final String people;
  final String date;
  final dynamic userName;
  final String workspaceId;
  final String startTime;
  final String endTime;
  final String price;
  final String status;
  final int bookingId;
  final dynamic decisionToken;
  final dynamic expiresIn;

  BookingModel({
    required this.roomID,
    required this.people,
    required this.date,
    this.userName,
    required this.workspaceId,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.status,
    required this.bookingId,
    this.decisionToken,
    this.expiresIn,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      roomID: json['roomID'],
      people: json['people'],
      date: json['date'],
      userName: json['user_name'],
      workspaceId: json['workspace_id'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      price: json['price'],
      status: json['status'],
      bookingId: json['booking_id'],
      decisionToken: json['decision_token'],
      expiresIn: json['expires_in'],
    );
  }
}
