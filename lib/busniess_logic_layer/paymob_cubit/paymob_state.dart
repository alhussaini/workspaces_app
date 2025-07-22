part of 'paymob_cubit.dart';

sealed class PaymobState extends Equatable {
  const PaymobState();

  @override
  List<Object> get props => [];
}

final class PaymobInitial extends PaymobState {}

final class PaymobLoading extends PaymobState {}

final class PaymobSuccess extends PaymobState {
  final String url;

 const PaymobSuccess({required this.url});
}

final class PaymobFauiler extends PaymobState {}

final class PaymobPaymentError extends PaymobState {}
