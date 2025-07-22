part of 'user_profile_cubit.dart';

sealed class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

final class UserProfileInitial extends UserProfileState {}

final class UserProfileLoading extends UserProfileState {}

final class UserProfileLoaded extends UserProfileState {
  final UserProfileModel userProfileModel;
  const UserProfileLoaded({required this.userProfileModel});
}

final class UserProfileFailure extends UserProfileState {
  final String error;

  const UserProfileFailure({required this.error});
}
