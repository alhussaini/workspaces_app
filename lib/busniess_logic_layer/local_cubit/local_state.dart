part of 'local_cubit.dart';

@immutable
sealed class LocalState {}

final class LocalInitial extends LocalState {}

final class LocalChanged extends LocalState {
  final Locale locale;

  LocalChanged({required this.locale});
}
