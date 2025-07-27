import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/helpers/dio_helper.dart';

class GetUserProfileDataService {
  final DioHelper dioHelper;
  GetUserProfileDataService({required this.dioHelper});
  // GetUserProfileDataService(this.token) {
  //   BaseOptions options = BaseOptions(
  //       baseUrl: MyStrings.baseUrl2,
  //       receiveDataWhenStatusError: true,
  //       headers: {
  //         //'User-Agent': 'Dart',
  //         'Content-Type': 'application/json',
  //         'Authorization': token
  //       });
  //   dio = Dio(options);
  // }
  Future<Map<String, dynamic>> getUserProfileData() async {
    final RequestOptions options = RequestOptions(
      method: "GET",
      path: "GET-profile",
      extra: {
        'baseUrl': MyStrings.baseUrl2,
        'requiresAuth':true,
      },
    );
    try {
      Response response = await dioHelper.dio.fetch(options);
      print("Response status code from user data: ${response.statusCode}");
      print("Response headers from user data: ${response.headers}");
      print("Response data from user data: ${response.data}");

      return response.data;
    } catch (e) {
      if (e is DioException) {
        print("DioError type: ${e.type}");
        print("DioError message: ${e.message}");
        print("DioError response: ${e.response?.data}");
        print("DioError status code: ${e.response?.statusCode}");
      }
      rethrow;
    }
  }
}
