import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:workspace/data_layer/error/fauiler.dart';
import 'package:workspace/data_layer/models/book_models/book_model.dart';
import 'package:workspace/data_layer/models/book_models/booking_request_body_model.dart';
import 'package:workspace/data_layer/web_servives/booking_services/book_request_service.dart';

class BookingRepo {
  final BookRequestService bookRequestService;
  BookingRepo(this.bookRequestService);
  Future<Either<Failure, BookingResponseModel>> bookingRequestRepo(
      BookingRequestBodyModel bookingRequestBody) async {
    try {
      var data =await bookRequestService.bookRequestService(bookingRequestBody);
      // ignore: avoid_print
      print("Response from booking repo is $data");
      return right(BookingResponseModel.fromJson(data)); 
    } catch (e) {
       if (e is DioException) {
        print("fauiler from booking repo is $e");
        return left(ServerFailure.fromDioError(e));
      } else {
        print("fauiler from booking repo is $e");
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
