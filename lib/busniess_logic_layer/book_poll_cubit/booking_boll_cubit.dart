import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workspace/data_layer/reopstries/booking_repo/book_poll_repo.dart';

part 'booking_boll_state.dart';

class BookingBollCubit extends Cubit<BookingBollState> {
  BookingBollCubit(this.bookingPollingRepo) : super(BookingBollInitial());
  final BookingPollingRepo bookingPollingRepo;
  Timer? timer;
  String amount = '';
  int elapsedSeconds = 215;
  bool hasShownPendingSnackBar = false;
  Future<void> bookBollrequest(int bookId, String myAmount,
      {int retryCount = 0}) async {
    var result = await bookingPollingRepo.bookingCheckPoll(bookId);
    amount = myAmount;
    result.fold((failure) {
      emit(BookingBollFailure());
    }, (success) {
      print("teeeeeeeeeeeeeeeeeeeeeeeeeeest");
      if (success.status == "pending" && elapsedSeconds < 245) {
        emit(BookingBollPending(hasShownPendingSnackBar));
        int delay = 5 + (retryCount * 2);
        elapsedSeconds += delay;
        timer?.cancel();
        timer = Timer(Duration(seconds: delay), () {
          hasShownPendingSnackBar = true;
          bookBollrequest(bookId, amount,
              retryCount: retryCount + 1); // Recursive call
        });
      } else if (success.status == "approved") {
        hasShownPendingSnackBar = false;
        elapsedSeconds = 0;
        emit(BookingBollApproved());
      } else if (success.status == "declined") {
        hasShownPendingSnackBar = false;
        elapsedSeconds = 0;
        emit(BookingBollRejected());
      } else if (elapsedSeconds >= 245) {
        hasShownPendingSnackBar = false;
        elapsedSeconds = 0;
        emit(BookingBollApproved());
      } else {
        hasShownPendingSnackBar = false;
        elapsedSeconds = 0;
        emit(BookingBollTimeout());
      }
    });
  }

  @override
  Future<void> close() {
    timer?.cancel(); // Ensure timer is canceled when cubit is closed
    return super.close();
  }
}
