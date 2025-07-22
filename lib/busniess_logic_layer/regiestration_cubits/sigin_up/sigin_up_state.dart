part of 'sigin_up_cubit.dart';

sealed class SiginUpState extends Equatable {
  const SiginUpState();

  @override
  List<Object> get props => [];
}

final class SiginUpInitial extends SiginUpState {}

final class SiginUpLoading extends SiginUpState {}

final class SiginUpSucsess extends SiginUpState {
  final String message;

  const SiginUpSucsess({required this.message});
}

final class SiginUpFauiled extends SiginUpState {
  final String errorMessage;

  const SiginUpFauiled({required this.errorMessage});
}
