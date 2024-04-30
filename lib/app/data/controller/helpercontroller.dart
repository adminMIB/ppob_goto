// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
// import 'package:lottie/lottie.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:ppob_mpay1/app/data/popup/views/customPopup.dart';
import 'package:ppob_mpay1/app/data/popup/views/loadingcustom.dart';
import 'package:ppob_mpay1/app/data/urlServices.dart';

class HelperController extends getx.GetxController {
  final Dio _client = Dio(
    BaseOptions(
      baseUrl: UrlListService.baseUrl,
      contentType: Headers.formUrlEncodedContentType,
    ),
  );

  Future<Object?> get<T>(
      {@required String? path,
      @required T Function(dynamic data)? onSuccess,
      @required T Function(dynamic error)? onError,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      bool isRawResult = false,
      bool isResultCode = false}) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      try {
        final response = await _client.get(
          path!,
          options: Options(headers: headers),
          queryParameters: queryParameters,
        );

        return isRawResult
            ? onSuccess!(response.data)
            : onSuccess!(response.data);
      } on DioError catch (e) {
        print('${e.message} for $path');
        print('Full response in onError: ${e.response?.toString()}');

        return isResultCode
            ? onError!(e.response?.statusCode)
            : onError!(e.response?.data);
      } catch (e) {
        print(e.toString());
        return onError!(e);
      }
    } else {
      // getx.Get.offAll(const NoConnectionPage());
    }
  }

  /// Performs a POST request with [body], then executes the functions
  /// with generic return value
  Future<Object?> post<T>({
    @required String? path,
    @required T Function(dynamic content)? onSuccess,
    @required T Function(dynamic error)? onError,
    @required Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool containsFile = false,
    bool isRawResult = false,
    bool isResultCode = false,
  }) async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      try {
        _client.interceptors.add(LogInterceptor());
        final response = await _client.post(
          path!,
          data: containsFile ? FormData.fromMap(body!) : body,
          options: Options(
            headers: headers,
            contentType: Headers.jsonContentType,
          ),
        );

        return isRawResult
            ? onSuccess!(response.data)
            : onSuccess!(response.data);
      } on DioError catch (e) {
        print('${e.message} for $path');
        // if (e.type == DioErrorType.connectionTimeout) {
        //   return getx.Get.offAll(const NoConnectionPage());
        // } else if (e.type == DioErrorType.receiveTimeout) {
        //   return getx.Get.offAll(const NoConnectionPage());
        // } else if (e.response?.statusCode == 412) {
        //   return getx.Get.offAll(const TokenExpiredPage());
        // } else if (e.type == DioErrorType.sendTimeout) {
        //   return getx.Get.offAll(const NoConnectionPage());
        // } else if (e.type == DioErrorType.sendTimeout) {
        //   return getx.Get.offAll(const NoConnectionPage());
        // }
        return isResultCode
            ? onError!(e.response?.statusCode)
            : onError!(e.response?.data);
      } catch (e) {
        print(e.toString());
        return onError!(e);
      }
    } else {
      // getx.Get.offAll(const NoConnectionPage());
      // print('No internet :( Reason:');
      // print(DataConnectionChecker().lastTryResults);
    }
  }

  /// Performs a PUT request with [body], then executes the functions
  /// with generic return value
  ///
  /// if the request contains a file, set [containsFile] to true
  Future<T> put<T>({
    @required String? path,
    @required T Function(dynamic content)? onSuccess,
    @required T Function(dynamic error)? onError,
    @required Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    bool containsFile = false,
    bool isRawResult = false,
  }) async {
    try {
      final response = await _client.put(
        path!,
        data: containsFile ? FormData.fromMap(body!) : body,
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
          ? onSuccess!(response.data)
          : onSuccess!(response.data['content']);
    } on DioError catch (e) {
      // print('${e.message} for ${UrlListService.baseUrl}$path');
      return onError!(e);
    } catch (e) {
      print(e.toString());
      return onError!(e);
    }
  }

  Future<T> delete<T>({
    @required String? path,
    @required T Function(dynamic content)? onSuccess,
    @required T Function(dynamic error)? onError,
    Map<String, dynamic>? headers,
    bool isRawResult = false,
  }) async {
    try {
      final response = await _client.delete(
        path!,
        options: Options(headers: headers),
      );

      return isRawResult
          ? onSuccess!(response.data)
          : onSuccess!(response.data['content']);
    } on DioError catch (e) {
      // print('${e.message} for ${UrlListService.baseUrl}$path');
      return onError!(e);
    } catch (e) {
      print(e.toString());
      return onError!(e);
    }
  }

  // loading() async {
  //   getx.Get.defaultDialog(
  //     barrierDismissible: false,
  //     backgroundColor: Colors.white,
  //     title: 'Loading...',
  //     content: Center(
  //       child: SizedBox(
  //         height: getx.Get.height * 0.2,
  //         child: Lottie.asset('assets/loading.json'),
  //       ),
  //     ),
  //   );
  // }

  popUpMessage(var pesan, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomPopupWidget(
        pesan: pesan,
      ),
    );
  }

  loading(BuildContext context) async {
    // await Future.delayed(Duration(seconds: 5));
    await Future.delayed(Duration.zero);
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => LoadingCustomWidget());
  }
}
