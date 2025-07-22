
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workspace/busniess_logic_layer/timer_cubit/timer_cubit.dart';
import 'package:workspace/constants/my_colors.dart';

class CountdownSnackBar extends StatelessWidget {
  final String contentText;
  final Duration duration;
  final VoidCallback? afterTimeExecute;
  final VoidCallback onPressed;

  const CountdownSnackBar({
    super.key,
    required this.contentText,
    required this.duration,
    this.afterTimeExecute, required this.onPressed,
  });

  String _formatDuration(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        final secondsRemaining = state is TimerTicking
            ? state.secondsRemaining
            : (state is TimerInitial
                ? state.durationInSeconds
                : duration.inSeconds);
        print('Building CountdownSnackBar with ${secondsRemaining}s remaining');
        if (state is TimerFinished) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            afterTimeExecute?.call();
          });
        }
        return Container(
          height: 70.h,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: MyColors.bottomColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  contentText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Text(
                _formatDuration(secondsRemaining),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(width: 8.w),
              ElevatedButton(
                onPressed:onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  minimumSize: const Size(60, 30),
                ),
                child: const Text('الغي الحجز'),
              ),
            ],
          ),
        );
      },
    );
  }
}
