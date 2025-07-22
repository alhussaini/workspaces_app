import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workspace/data_layer/models/book_models/booking_request_body_model.dart';
import 'package:workspace/data_layer/reopstries/booking_repo/booking_repo.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit({
    required this.roomId,
    required this.workspaceId,
    required this.isCalender,
    required this.bookingRepo,
  }) : super(BookingInitial());
  final String roomId;
  final String workspaceId;
  bool isCalender;
  final BookingRepo bookingRepo;
  // Variables to store selected dates(days)
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  // Variables to init dates(days)
  DateTime firstDate = DateTime(2023);
  DateTime lastDate = DateTime(2030);
// Variables to store selected times
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay(
    hour: (TimeOfDay.now().hour + 1) % 24,
    minute: TimeOfDay.now().minute,
  );
//*********
  bool isStart = true;
  int bookingDurationInMinutes = 0;
  int personaNum = 1;
  double pricePerhour = 50;
  double totalBookingPrice = 0;

  String bookDuration = '1 س';

  void triggerPage() {
    if (isCalender) {
      totalBookingPrice = pricePerhour;
      emit(BookingWithCalender());
    } else {
      emit(BookingWithoutCalender());
    }
  }

  void updateDates(
      {required DateTime pickerStartdate, required DateTime pickerEnddate}) {
    if (pickerStartdate != startDate) {
      startDate = pickerStartdate;
      emit(BookingStartDateUpdate());
    } else if (pickerEnddate != endDate) {
      endDate = pickerEnddate;
      emit((BookingEndDateUbdate()));
    } else if (pickerStartdate != startDate && pickerEnddate != endDate) {
      emit(BookingUpdateBothDates());
    }
  }

  void updateStartTime({required TimeOfDay pickerStartTime}) {
    if (pickerStartTime != startTime) {
      startTime = pickerStartTime;
      isStart = false;
      emit(BookingTimeUpdate(
          DateTime.now().microsecondsSinceEpoch)); // Add unique value
    }
  }

  void updateEndTime({required TimeOfDay pickerEndTime}) {
    if (pickerEndTime != endTime) {
      endTime = pickerEndTime;
      isStart = true;
      emit(BookingTimeUpdate(
          DateTime.now().microsecondsSinceEpoch)); // Add unique value
    }
  }

  void calculateBookingDuration() {
    int startMinutes = startTime.hour * 60 + startTime.minute;
    int endMinutes = endTime.hour * 60 + endTime.minute;
    int durationInMinutes;
    if (endMinutes == startMinutes) {
      durationInMinutes = 24 * 60; // 24 hours in minutes
      bookingDurationInMinutes = durationInMinutes;
      bookDuration = "24 س";
    } else if (endMinutes > startMinutes) {
      durationInMinutes = endMinutes - startMinutes;
    } else {
      durationInMinutes = (24 * 60 - startMinutes) + endMinutes;
    }
    bookingDurationInMinutes = durationInMinutes;

    int hours = durationInMinutes ~/ 60;
    int minutes = durationInMinutes % 60;
    bookDuration = '$hours س و$minutes دقيقة';
  }

  int getDayCount(DateTime start, DateTime end) {
    return end.difference(start).inDays + 1;
  }

  void calculateTotalPrice() {
    final double pricePerMinute = pricePerhour / 60;

    int minutesPerDay = bookingDurationInMinutes;
    int days = getDayCount(startDate, endDate);

    double totalPriceForUnCountableRooms =
        minutesPerDay * pricePerMinute * days;
    print('per one $totalPriceForUnCountableRooms');
    if (isCalender) {
      emit(BookingChangePrice(totalPriceForUnCountableRooms.toString()));
      totalBookingPrice = totalPriceForUnCountableRooms;
    } else {
      double totalPrice = totalPriceForUnCountableRooms * personaNum;
      print(totalPrice);
      totalBookingPrice = totalPrice;
      emit(BookingChangePrice(totalPrice.toString()));
    }
  }

  Future<void> bookRequest() async {
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd', 'en');
    final DateFormat timeFormatter = DateFormat('h:mma', 'en');
    final BookingRequestBodyModel bookingRequestBody = BookingRequestBodyModel(
        roomId: roomId,
        workspaceId: workspaceId,
        startDate: startDate.toString(),
        endDate: endDate.toString(),
        startTime: startTime.toString(),
        endTime: endTime.toString(),
        people: personaNum,
        price: 75);
    var result = await bookingRepo.bookingRequestRepo(bookingRequestBody);
    result.fold((failure) {
      print("pending from fauiler");
      emit(BookingFauiler(errorMessage: failure.errorMessage));
    }, (sucsees) {
      print(sucsees.booking.status);
      print("pending from success");
      emit(BookingPendingStatus(
          amount: totalBookingPrice.toString(),
          pending: sucsees.booking.status,
          bookId: sucsees.booking.bookingId));
    });
  }
}
