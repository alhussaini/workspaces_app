import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:workspace/data_layer/error/fauiler.dart';
import 'package:workspace/data_layer/models/book_models/book_poll.dart';
import 'package:workspace/data_layer/web_servives/booking_services/book_check.dart';

class BookingPollingRepo {
  final BookCheckService bookCheck;

  BookingPollingRepo(this.bookCheck);

  Future<Either<Failure,BookPoll >> bookingCheckPoll(int bookingId) async {
    try {
      final Map<String, dynamic> data = await bookCheck.bookPolling(bookingId);
      final statusModel = BookPoll.fromJson(data);
      return Right(statusModel);
    } catch (e) {
      if (e is DioException) {
        print("DioError occurred in BookingPollingRepo: $e");
        return Left(ServerFailure.fromDioError(e));
      } else {
        print("Unexpected error in BookingPollingRepo: $e");
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}