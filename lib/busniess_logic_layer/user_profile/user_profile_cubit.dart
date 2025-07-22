import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workspace/data_layer/models/user_profile_models/user_profile_model.dart';
import 'package:workspace/data_layer/reopstries/user_profile_repo/user_progile_repo.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final UserProfileRepo userProfileRepo;
  UserProfileModel? myUserProfileModel;

  UserProfileCubit({required this.userProfileRepo})
      : super(UserProfileInitial());
  Future<void> getUserProfileData() async {
    emit(UserProfileLoading());
    var result = await userProfileRepo.getWorkspacesDataFromService();
    print('result from user $result');
    result.fold((failure) {
      emit(UserProfileFailure(error: failure.errorMessage));
    }, (userProfileModel) {
      myUserProfileModel = userProfileModel;
      emit(UserProfileLoaded(userProfileModel: userProfileModel));
    });
  }
}
