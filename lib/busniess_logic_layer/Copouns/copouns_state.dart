part of 'copouns_cubit.dart';

sealed class CopounsState extends Equatable {
  const CopounsState();

  @override
  List<Object> get props => [];
}

final class CopounsInitial extends CopounsState {}

final class CopounsEmpty extends CopounsState {
  final String message = "لا يوجد اي عروض الان";
}

final class CopounsLoaded extends CopounsState {
  final List<CoupounModel> coupons;
  const CopounsLoaded(this.coupons);
}
