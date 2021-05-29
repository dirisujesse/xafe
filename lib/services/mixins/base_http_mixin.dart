import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:xafe/models/http/response/error/error_response.dart';

mixin XfHttpMixin {
  Future<T> dioMiddleWare<T>(
    Future<T> Function() func,
  ) async {
    try {
      final result = await func();
      return result;
    } on DioError catch (exception, stackTrace) {
      ///Only show the logs in debug mode.
      if (kDebugMode) {
        log('===Exception:$exception===');
        log('\n\n===Exception:$stackTrace===');
      }

      throw HttpErrorResponse(
        statusCode: exception.response?.statusCode ?? 400,
        data: exception.response?.data ??
            {"message": exception.error ?? exception},
      );
    }
  }
}
