import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/helpers/dio_helper.dart';

class GetWorkspacesDataService {
  final DioHelper dioHelper;

  GetWorkspacesDataService({required this.dioHelper});
  Future<Map<String, dynamic>> getWorkspacesData() async {
    try {
      final options = RequestOptions(
        method: "GET",
        path: "workspace-data",
        extra: {
          'requiresAuth':true,
          'baseUrl': MyStrings.baseUrl2,
        },
      );
      Response response = await dioHelper.dio.fetch(options);
      print("Response status code from getWorkspacesData service: ${response.statusCode}");

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
