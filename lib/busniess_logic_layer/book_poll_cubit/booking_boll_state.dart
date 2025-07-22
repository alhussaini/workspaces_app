part of 'booking_boll_cubit.dart';

sealed class BookingBollState extends Equatable {
  const BookingBollState();

  @override
  List<Object> get props => [];
}

final class BookingBollInitial extends BookingBollState {}
final class BookingBollApproved extends BookingBollState {}
final class BookingBollRejected extends BookingBollState {}
final class BookingBollPending extends BookingBollState {
final bool hasShownPendingSnackBar;
const BookingBollPending(this.hasShownPendingSnackBar);
} 
final class BookingBollTimeout extends BookingBollState {}
final class BookingBollFailure extends BookingBollState {}
