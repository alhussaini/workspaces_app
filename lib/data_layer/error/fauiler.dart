import 'package:dio/dio.dart';

// Abstract class representing a failure during API calls
abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

// Concrete subclass of Failure for server-related errors
class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  // Factory method to create a ServerFailure instance from a DioError
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
//الصوت مش هيكون مسموع / عايز ايه معاك يخويا ؟؟؟ status code بيرجع لما بكتبه غلط انما لو صح بيبثي نل
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode,
          dioError.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
      // if (dioError.message!.contains('SocketException')) {
      //   return ServerFailure('No Internet Connection');
      // }
      // return ServerFailure('Unexpected Error, Please try again!');

      default:
        return ServerFailure('Oops! There was an Error, Please try again');
    }
  }

  // Factory method to create a ServerFailure instance from an HTTP response
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422) {
      return ServerFailure(response['error'] ?? 'Client error occurred');
    } else if (statusCode == 404) {
      return ServerFailure(response['message']);
      // return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error, Please try later');
    } else if (statusCode == 409) {
      return ServerFailure(response['message']);
    } else {
      return ServerFailure('Oops! There was an Error, Please try again');
    }
  }
}
