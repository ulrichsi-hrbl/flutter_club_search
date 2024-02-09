import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'dart:io';

import '../core/endpoints.dart';
import '../core/headers.dart';
import 'async_auth_provider.dart';

part 'dio_engage_provider.g.dart';

@riverpod
Dio dioEngage(DioEngageRef ref) {
  final authToken =
      ref.watch(authenticateProvider.notifier).getCurrentToken() ?? '';
  final authHeaders = {...apiHeaders, 'x-hluser-token': authToken};

  final dio =
      Dio(BaseOptions(baseUrl: Endpoints.baseURL, headers: authHeaders));
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
