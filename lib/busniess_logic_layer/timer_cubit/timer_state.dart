part of 'timer_cubit.dart';

sealed class TimerState extends Equatable {
  const TimerState();
  int get secondsRemaining => 0;
  @override
  List<Object> get props => [];
}

final class TimerInitial extends TimerState {
  final int durationInSeconds;

  const TimerInitial({required this.durationInSeconds});
}

final class TimerTicking extends TimerState {
  
  final int secondsRemaining;

  const TimerTicking({required this.secondsRemaining});

  @override
  List<Object> get props => [secondsRemaining];
}

final class TimerFinished extends TimerState {}
