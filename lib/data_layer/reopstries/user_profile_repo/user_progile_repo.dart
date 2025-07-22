import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:workspace/data_layer/error/fauiler.dart';
import 'package:workspace/data_layer/models/user_profile_models/user_profile_model.dart';
import 'package:workspace/data_layer/web_servives/user_profile_services/get_user_profile_data.dart';

class UserProfileRepo {
  final GetUserProfileDataService getUserProfileDataService;
  UserProfileRepo({required this.getUserProfileDataService});
 Future<Either<Failure, UserProfileModel>> getWorkspacesDataFromService(
      ) async {
    try {
      var data = await getUserProfileDataService.getUserProfileData();
      print("Response from UserProfileRepo repo is $data");
      return right(UserProfileModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        print("fauiler from UserProfileRepo repo is $e");
        return left(ServerFailure.fromDioError(e));
      } else {
        print("fauiler from UserProfileRepo repo is $e");
        return left(ServerFailure(e.toString()));
      }
    }
  }
}