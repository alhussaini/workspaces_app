import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workspace/data_layer/models/workspace_models/copoun_model.dart';

part 'copouns_state.dart';

class CopounsCubit extends Cubit<CopounsState> {
  CopounsCubit() : super(CopounsInitial());
  void loadCoupons(List<CoupounModel> coupons) {
    if (coupons.isEmpty) {
      emit(CopounsEmpty());
    } else {
      emit(CopounsLoaded(coupons));
    }
  }
}
