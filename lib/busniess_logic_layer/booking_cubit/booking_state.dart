part of 'booking_cubit.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {}

final class BookingWithCalender extends BookingState {}

final class BookingWithoutCalender extends BookingState {}

final class BookingPendingStatus extends BookingState {
  final String pending;
  final String amount;
  final int bookId;

  const BookingPendingStatus({required this.amount,required this.pending,required this.bookId});
}

final class BookingFauiler extends BookingState {
  final String errorMessage;
  

  const BookingFauiler({required this.errorMessage});
}

final class BookingStartDateUpdate extends BookingState {}

final class BookingEndDateUbdate extends BookingState {}

final class BookingUpdateBothDates extends BookingState {}

// Add these state constructors
class BookingTimeUpdate extends BookingState {
  final int timestamp;
  const BookingTimeUpdate(this.timestamp);
}

class BookingChangePrice extends BookingState {
  final String price;
  const BookingChangePrice(this.price);
}
