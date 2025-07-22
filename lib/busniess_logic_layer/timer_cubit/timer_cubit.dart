import 'dart:async';
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerInitial(durationInSeconds: 240));
  Timer? _timer;

  void start({required int durationSeconds, VoidCallback? onComplete}) {
    _stopTimer();
    print('TimerCubit started with ${durationSeconds}s');
    emit(TimerTicking(secondsRemaining: durationSeconds));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentSeconds = state is TimerTicking
          ? (state as TimerTicking).secondsRemaining - 1
          : 0;
      if (currentSeconds > 0) {
        print('TimerCubit tick: ${currentSeconds}s remaining');
        emit(TimerTicking(secondsRemaining: currentSeconds));
      } else {
        print('TimerCubit completed');
        _stopTimer();
        emit(TimerFinished());
      }
    });
  }

  void stop() {
    print('TimerCubit stopped');
    _stopTimer();
    emit(const TimerInitial(durationInSeconds: 240));
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  Future<void> close() {
    _stopTimer();
    return super.close();
  }
}