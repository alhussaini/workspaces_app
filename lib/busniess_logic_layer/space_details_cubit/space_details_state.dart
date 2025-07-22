part of 'space_details_cubit.dart';

sealed class SpaceDetailsState extends Equatable {
  const SpaceDetailsState();

  @override
  List<Object> get props => [];
}

final class SpaceDetailsInitial extends SpaceDetailsState {}
final class SpaceDetailsLoaded extends SpaceDetailsState {}