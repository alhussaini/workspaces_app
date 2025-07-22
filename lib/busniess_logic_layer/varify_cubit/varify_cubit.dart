import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'varify_state.dart';

class VarifyCubit extends Cubit<VarifyState> {
  VarifyCubit() : super(VarifyInitial());
}
