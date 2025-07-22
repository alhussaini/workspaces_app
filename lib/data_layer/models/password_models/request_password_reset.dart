class RequestPasswordResetResponse {
  final bool success;
  final Data data;

  RequestPasswordResetResponse({required this.data,required this.success});
  factory RequestPasswordResetResponse.fromJson(Map<String, dynamic> json) {
    return RequestPasswordResetResponse(
      success: json['success'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String message;

  Data({required this.message});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      message: json['message'],
    );
  }
}
