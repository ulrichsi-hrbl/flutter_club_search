import 'dart:io';

import '../core/endpoints.dart';
import '../core/headers.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_auth_provider.g.dart';

@riverpod
Dio dioAuth(DioAuthRef ref) {
//    BaseOptions(baseUrl: Endpoints.baseURL, headers: authHeaders),
  final dio =
      Dio(BaseOptions(baseUrl: Endpoints.authBaseURL, headers: authHeaders));
  if (!kIsWeb) {
    dio.httpClientAdapter = IOHttpClientAdapter(
      onHttpClientCreate: (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );
  }
  return dio;
}
