import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';
// import 'package:ssl_pinning_plugin/ssl_pinning_plugin.dart';
// import 'package:http_certificate_pinning/certificate_pinning_interceptor.dart';

class NetworkHelper {
  // String _fingerprint =
  //     "87 97 13 26 15 DC E7 90 ED 82 C9 67 CB 7A 07 40 4B 32 6E 8F 89 3B 01 A9 37 38 C7 A9 EF 6B BE 26";
  // List<String> allowedShA1FingerprintList = [];

  var pref = GetStorage();

  final Dio _client = Dio(
    BaseOptions(
      baseUrl: UrlListService.baseUrl,
      // receiveTimeout: 10000, // 10 seconds
      // sendTimeout: 10000,
      contentType: Headers.formUrlEncodedContentType,
    ),
  );

  /// Performs a GET request with [queryParameters]
  Future<Object?> get<T>(
      {required String path,
      required T Function(dynamic data) onSuccess,
      required T Function(dynamic error) onError,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      bool isRawResult = false,
      bool isResultCode = false}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      try {
        final response = await _client.get(
          path,
          options: Options(
            headers: headers,
          ),
          queryParameters: queryParameters,
        );

        var tokenHeader = response.headers['Authorization'];
        if (tokenHeader != null) {
          pref.write('token',
              tokenHeader.toString().replaceAll('[', '').replaceAll(']', ''));
          pref.write('bearerToken',
              tokenHeader.toString().replaceAll('[', '').replaceAll(']', ''));
        }

        return isRawResult
            ? onSuccess(response.data)
            : onSuccess(response.data['data']);
      } on DioError catch (e) {
        // print('${e.message} for ${UrlListService.baseUrl}$path');
        // if (e.type == DioErrorType.connectTimeout) {
        //   return getx.Get.offAll(NoConnectionPage());
        // } else if (e.type == DioErrorType.receiveTimeout) {
        //   return getx.Get.offAll(NoConnectionPage());
        // } else if (e.response?.statusCode == 412) {
        //   return getx.Get.offAll(TokenExpiredPage());
        // } else if (e.type == DioErrorType.sendTimeout) {
        //   return getx.Get.offAll(NoConnectionPage());
        // } else if (e.type == DioErrorType.sendTimeout) {
        //   return getx.Get.offAll(NoConnectionPage());
        // }
        return isResultCode
            ? onError(e.response?.statusCode)
            : onError(e.response?.data);
      } catch (e) {
        print(e.toString());
        return onError(e);
      }
    } else {
      // getx.Get.offAll(NoConnectionPage());
    }
  }

  /// Performs a POST request with [body], then executes the functions
  /// with generic return value
  Future<Object?> postLogin<T>({
    required String path,
    required T Function(dynamic content) onSuccess,
    required T Function(dynamic error) onError,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    bool containsFile = false,
    bool isRawResult = false,
    bool isResultCode = false,
  }) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      try {
        // String _fingerprint =
        //     'EB 31 BA BD 43 66 E2 1A BD 3A EA 7A D3 66 4A 37 BE 59 3A 04 05 B1 6F F5 DC B9 8D DE D8 7C 5E 06';

        // List<String> allowedShA1FingerprintList = [_fingerprint];
        // String _status = await SslPinningPlugin.check(
        //   serverURL: UrlListService.baseUrl + path,
        //   headerHttp: new Map(),
        //   httpMethod: HttpMethod.Get,
        //   sha: SHA.SHA256,
        //   allowedSHAFingerprints: allowedShA1FingerprintList,
        //   timeout: 100,
        // );
        // if (_status == "CONNECTION_SECURE") {
        try {
          _client.interceptors.add(LogInterceptor());

          final response = await _client.post(
            path,
            data: containsFile ? FormData.fromMap(body) : body,
            options: Options(
              headers: headers,
              contentType: Headers.jsonContentType,
            ),
          );

          return isRawResult
              ? onSuccess(response.data)
              : onSuccess(response.data);
        } on DioError catch (e) {
          // print('${e.message} for ${UrlListService.baseUrl}$path');
          print(e.response?.data);

          // if (e.type == DioErrorType.connectTimeout) {
          //   return getx.Get.offAll(NoConnectionPage());
          // } else if (e.type == DioErrorType.receiveTimeout) {
          //   return getx.Get.offAll(NoConnectionPage());
          // } else if (e.type == DioErrorType.sendTimeout) {
          //   return getx.Get.offAll(NoConnectionPage());
          // } else if (e.response?.statusCode == 412) {
          //   pref.remove('token');
          //   return getx.Get.offAll(TokenExpiredPage());
          // } else if (isResultCode) {
          //   return onError(e.response?.statusCode);
          // } else if (!isResultCode) {
          //   if (e.response?.data == null) {
          //     getx.Get.offAll(ErrorPage());
          //   }
          //   return onError(e.response?.data);
          // } else {
          //   return onError(e);
          // }
        } catch (e) {
          print(e.toString());
          return onError(e);
        }
        // }
      } catch (error) {
        print('Error $error');
        // return getx.Get.offAll(ErrorPage(tipe: 'not_secure'));
      }
    } else {
      // getx.Get.offAll(NoConnectionPage());
      print('No internet :( Reason:');
      // print(InternetConnectionChecker().lastTryResults);
    }
  }

  Future<Object?> post<T>({
    required String path,
    required T Function(dynamic content) onSuccess,
    required T Function(dynamic error) onError,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    bool containsFile = false,
    bool isRawResult = false,
    bool isResultCode = false,
  }) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      try {
        // String _fingerprint =
        //     'EB 31 BA BD 43 66 E2 1A BD 3A EA 7A D3 66 4A 37 BE 59 3A 04 05 B1 6F F5 DC B9 8D DE D8 7C 5E 06';

        // List<String> allowedShA1FingerprintList = [_fingerprint];
        // String _status = await SslPinningPlugin.check(
        //   serverURL: UrlListService.baseUrl + path,
        //   headerHttp: new Map(),
        //   httpMethod: HttpMethod.Get,
        //   sha: SHA.SHA256,
        //   allowedSHAFingerprints: allowedShA1FingerprintList,
        //   timeout: 100,
        // );
        // if (_status == "CONNECTION_SECURE") {
        print('header : $headers');
        try {
          _client.interceptors.add(LogInterceptor());

          final response = await _client.post(
            path,
            data: containsFile ? FormData.fromMap(body) : body,
            options: Options(
              headers: headers,
              contentType: Headers.jsonContentType,
            ),
          );

          var tokenHeader = response.headers['Authorization'];
          if (tokenHeader != null) {
            pref.write('token',
                tokenHeader.toString().replaceAll('[', '').replaceAll(']', ''));
            pref.write('bearerToken',
                tokenHeader.toString().replaceAll('[', '').replaceAll(']', ''));
          }
          // pref.write('token', tokenHeader.toString().replaceAll('[', '').replaceAll(']', ''));
          // pref.write('bearerToken', tokenHeader.toString().replaceAll('[', '').replaceAll(']', ''));

          return isRawResult
              ? onSuccess(response.data)
              : onSuccess(response.data);
        } on DioError catch (e) {
          print('${e.message} for ${UrlListService.baseUrl}$path');
          print(e.response?.data);

          // if (e.type == DioErrorType.connectTimeout) {
          //   return getx.Get.offAll(NoConnectionPage());
          // } else if (e.type == DioErrorType.receiveTimeout) {
          //   return getx.Get.offAll(NoConnectionPage());
          // } else if (e.type == DioErrorType.sendTimeout) {
          //   return getx.Get.offAll(NoConnectionPage());
          // } else if (e.response?.statusCode == 412) {
          //   pref.remove('token');
          //   return getx.Get.offAll(TokenExpiredPage());
          // } else if (isResultCode) {
          //   return onError(e.response?.statusCode);
          // } else if (!isResultCode) {
          //   if (e.response?.data == null) {
          //     getx.Get.offAll(ErrorPage());
          //   }
          //   return onError(e.response?.data);
          // } else {
          //   return onError(e);
          // }
        } catch (e) {
          // print('body: $body');
          // print('headers: $headers');
          print(e.toString());
          return onError(e);
        }
        // }
      } catch (error) {
        print('Error $error');
        // return getx.Get.offAll(ErrorPage(tipe: 'not_secure'));
      }
    } else {
      // getx.Get.offAll(NoConnectionPage());
      print('No internet :( Reason:');
      // print(InternetConnectionChecker().lastTryResults);
    }
  }

  /// Performs a PUT request with [body], then executes the functions
  /// with generic return value
  ///
  /// if the request contains a file, set [containsFile] to true
  Future<T> put<T>({
    required String path,
    required T Function(dynamic content) onSuccess,
    required T Function(dynamic error) onError,
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
    bool containsFile = false,
    bool isRawResult = false,
  }) async {
    try {
      final response = await _client.put(
        path,
        data: containsFile ? FormData.fromMap(body) : body,
        // Comment out to check progress on data sending
        // onSendProgress: (int sent, int total) {
        //   print('$sent $total');
        // },
        options: Options(
          headers: headers,
          contentType: Headers.formUrlEncodedContentType,
        ),
      );

      return isRawResult
          ? onSuccess(response.data)
          : onSuccess(response.data['content']);
    } on DioError catch (e) {
      // print('${e.message} for ${UrlListService.baseUrl}$path');
      return onError(e);
    } catch (e) {
      // print(e.toString());
      return onError(e);
    }
  }

  Future<Object?> delete<T>({
    required String path,
    required T Function(dynamic content) onSuccess,
    required T Function(dynamic error) onError,
    Map<String, dynamic>? headers,
    bool isRawResult = false,
    bool containsFile = false,
    bool isResultCode = false,
  }) async {
    // try {
    //   final response = await _client.delete(
    //     path,
    //     options: Options(headers: headers),
    //   );

    //   return isRawResult
    //       ? onSuccess(response.data)
    //       : onSuccess(response.data['content']);
    // } on DioError catch (e) {
    //   print('${e.message} for ${UrlListService.baseUrl}$path');
    //   return onError(e);
    // } catch (e) {
    //   print(e.toString());
    //   return onError(e);
    // }

    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      try {
        // String _fingerprint =
        //     'EB 31 BA BD 43 66 E2 1A BD 3A EA 7A D3 66 4A 37 BE 59 3A 04 05 B1 6F F5 DC B9 8D DE D8 7C 5E 06';

        // List<String> allowedShA1FingerprintList = [_fingerprint];
        // String _status = await SslPinningPlugin.check(
        //   serverURL: UrlListService.baseUrl + path,
        //   headerHttp: new Map(),
        //   httpMethod: HttpMethod.Get,
        //   sha: SHA.SHA256,
        //   allowedSHAFingerprints: allowedShA1FingerprintList,
        //   timeout: 100,
        // );
        // if (_status == "CONNECTION_SECURE") {
        try {
          _client.interceptors.add(LogInterceptor());
          final response = await _client.delete(
            path,
            options: Options(headers: headers),
          );

          return isRawResult
              ? onSuccess(response.data)
              : onSuccess(response.data);
        } on DioError catch (e) {
          // print('${e.message} for ${UrlListService.baseUrl}$path');
          // print(e.response.data);
          // if (e.type == DioErrorType.connectTimeout) {
          //   return getx.Get.offAll(NoConnectionPage());
          // } else if (e.type == DioErrorType.receiveTimeout) {
          //   return getx.Get.offAll(NoConnectionPage());
          // } else if (e.type == DioErrorType.sendTimeout) {
          //   return getx.Get.offAll(NoConnectionPage());
          // } else if (isResultCode) {
          //   return onError(e.response?.statusCode);
          // } else if (!isResultCode) {
          //   if (e.response?.data == null) {
          //     getx.Get.offAll(ErrorPage());
          //   }
          //   return onError(e.response?.data);
          // } else {
          //   return onError(e);
          // }
        } catch (e) {
          // print(e.toString());
          return onError(e);
        }
        // }
      } catch (error) {
        // print('Error $error');
        // return getx.Get.offAll(ErrorPage(tipe: 'not_secure'));
      }
    } else {
      // getx.Get.offAll(NoConnectionPage());
      print('No internet :( Reason:');
      // print(InternetConnectionChecker().lastTryResults);
    }
  }
}
