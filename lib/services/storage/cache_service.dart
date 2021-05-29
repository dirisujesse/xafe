import 'package:dio/dio.dart';
import 'package:xafe/services/storage/storage_service.dart';

mixin CacheService {
  ///
  /// ### CacheService fetch
  ///
  /// `Fetch` serves as an helper to read reponses stored to the cache
  /// It takes a `DioError` object as input from which it extracts a key
  /// matching a (potentially) pre cached response.
  ///
  /// If no match is found the inputed error is thrown
  ///
  /// It serves to allow for offline usage of `blog_Blogs`
  ///
  Future<dynamic> fetch(DioError e) async {
    final error = {
      "message": e.response?.data ?? e.error ?? e,
      "data": e.response?.data,
      "statusCode": e.response?.statusCode
    };
    try {
      final key =
          "${e.requestOptions.baseUrl}::${e.requestOptions.path}::${e.requestOptions.queryParameters}";
      final data = LocalStorage.getItem(
        key.toLowerCase(),
        defaultValue: false,
      );
      if (data == false) {
        throw error;
      }
      return data;
    } catch (_) {
      throw error;
    }
  }

  ///
  /// ### CacheService cacheResponse
  ///
  /// `CacheResponse` serves as an helper to read data off responses from network calls
  /// It takes a `Response` object as input from which it extracts response data to be cached
  /// as well as a key by which to subsequently read the cached response
  ///
  /// If a failure to cache occurs the computation silently fails
  ///
  cacheResponse(Response req) async {
    try {
      final key =
          "${req.requestOptions.baseUrl}::${req.requestOptions.path}::${req.requestOptions.queryParameters}";
      await LocalStorage.setItem(
        key: key.toLowerCase(),
        value: req.data,
      );
    } catch (_) {
    }
  }
}
