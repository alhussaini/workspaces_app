part of 'varify_cubit.dart';

sealed class VarifyState extends Equatable {
  const VarifyState();

  @override
  List<Object> get props => [];
}

final class VarifyInitial extends VarifyState {}
final class VarifySuccess extends VarifyState {}
final class VarifyFauiler extends VarifyState {}
final class VarifyLoading extends VarifyState {}