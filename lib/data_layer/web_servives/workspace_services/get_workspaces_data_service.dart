import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';

class GetWorkspacesDataService {
  late Dio dio;
  GetWorkspacesDataService() {
    BaseOptions options = BaseOptions(
      baseUrl: MyStrings.baseUrl2,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> getWorkspacesData() async {
    try {
      Response response = await dio.get(
        'workspace-data',
        // queryParameters: {
        //   'clear_cache': true,
        // },
      );
      print("Response status code: ${response.statusCode}");
      // print("Response data: ${response.data}");

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
