// dio_helper.dart
import 'package:dio/dio.dart';
import 'package:workspace/constants/my_strings.dart';
import 'package:workspace/data_layer/models/secure_storage.dart';

class DioHelper {
  final Dio dio = Dio();

  DioHelper() {
    dio.options = BaseOptions(
      baseUrl: MyStrings.baseUrl1,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
      receiveDataWhenStatusError:
          true, 
    );

    dio.interceptors.add(_createInterceptor());
  }

  Interceptor _createInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        // 🔁 Check if this request wants a different base URL
        final dynamicBaseUrl = options.extra['baseUrl'] as String?;
        if (dynamicBaseUrl != null) {
          options.baseUrl = dynamicBaseUrl;
        } else {
          options.baseUrl = dio.options.baseUrl;
        }

        // Add Authorization if needed
        final requiresAuth = options.extra['requiresAuth'] ?? false;
        if (requiresAuth) {
          final token = await SecureStorage.accessToken;
          if (token != null) {
            options.headers['Authorization'] = token;
          }
        }

        handler.next(options);
      },
      onError: (DioException e, handler) async {
        final requiresAuth = e.requestOptions.extra['requiresAuth'] ?? true;

        if (requiresAuth && e.response?.statusCode == 401) {
          final success = await _refreshToken();
          if (success) {
            final newToken = await SecureStorage.accessToken;
            final original = e.requestOptions;
            original.headers['Authorization'] = newToken;
            return handler.resolve(await dio.fetch(original));
          } else {
            await SecureStorage.deleteAll();
            // Optionally trigger logout (via Cubit or Navigation)
          }
        }

        handler.reject(e);
      },
    );
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await SecureStorage.refreshToken;
      if (refreshToken == null) return false;

      final response = await dio.post(
        'https://your-api.com/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      final newAccessToken = response.data['access_token'] as String?;
      final newRefreshToken = response.data['refresh_token'] as String?;

      if (newAccessToken == null) return false;

      await SecureStorage.setAccessToken(newAccessToken);
      if (newRefreshToken != null) {
        await SecureStorage.setRefreshToken(newRefreshToken);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
