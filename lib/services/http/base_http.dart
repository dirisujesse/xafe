import 'package:dio/dio.dart';
import 'package:xafe/models/config/app_config.dart';
import 'package:xafe/models/podos/token.dart';
import 'package:xafe/utils/connection.dart';
import 'package:xafe/utils/helpers.dart';
import 'package:xafe/utils/token_manager.dart';
import 'package:xafe/utils/typedefs.dart';

class _XfTransformer extends DefaultTransformer {
  _XfTransformer() : super(jsonDecodeCallback: parseJson);
}

class XfHttpService {
  late Dio http;
  late CancelToken cancelToken;
  late String? collectionUrl;

  Dio get tokenHttp {
    return Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        connectTimeout: 1000 * 180,
        receiveTimeout: 1000 * 180,
        headers: {'Accept': "application/json"},
      ),
    );
  }

  Future<void> _renewToken(String refreshtoken) async {
    try {
      http.interceptors.requestLock.lock();
      final req = await tokenHttp.post(
        "/auth/refresh-token",
        data: {"refreshToken": refreshtoken},
      );
      XfTokenManager.instance.setToken(
        accessToken: req.data["accessToken"],
        refreshToken: refreshtoken,
        mobileNumber: XfTokenManager.instance.tokens.mobileNumber,
      );
      http.interceptors.requestLock.unlock();
    } catch (e) {
      http.interceptors.requestLock.unlock();
    }
  }

  XfHttpService({this.collectionUrl = ""}) {
    cancelToken = new CancelToken();
    http = Dio(
      BaseOptions(
        baseUrl: "${AppConfig.baseUrl}$collectionUrl",
        connectTimeout: 1000 * 60,
        receiveTimeout: 1000 * 60,
        headers: {'Accept': "application/json"},
      ),
    )
      ..interceptors.add(_XfHttpInterceptor(_renewToken))
      ..transformer = _XfTransformer();
  }

  void cancelReqs() {
    cancelToken.cancel("Request has been cancelled");
  }

  FormData generateFormData(Map<String, dynamic> data) {
    return FormData.fromMap(data);
  }
}

class _XfHttpInterceptor implements InterceptorsWrapper {
  OnChangedAsync<String> refreshTokenCallback;

  _XfHttpInterceptor(this.refreshTokenCallback);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print({
      "statusCode": err.response?.statusCode ?? 400,
      "statusMessage": err.response?.statusMessage,
      "data": err.response?.data ?? {"message": err.error ?? err}
    });
    bool result = true;
    try {
      result = await hasConnection();
    } catch (_) {}
    if (!result) {
      return handler.next(
        DioError(
          requestOptions: err.requestOptions,
          response: Response(
            requestOptions: err.requestOptions,
            data: {
              "message": "kindly check your internet connection and try again"
            },
            statusCode: 5000,
            statusMessage: "No Internet Connection",
          ),
        ),
      );
    }
    return handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    XfTokenManager _tokenManager = XfTokenManager.instance;
    if (_tokenManager.shouldRefreshToken) {
      await refreshTokenCallback(_tokenManager.tokens.refreshToken ?? "");
    }
    XfTokenModel tokens = _tokenManager.tokens;
    options.headers["Authorization"] = "Bearer ${tokens.accessToken}";
    print({
      "url": "${options.baseUrl}${options.path}",
      "body": options.data,
      "params": options.queryParameters,
      "header": options.headers,
      "method": options.method,
    });
    return handler.next(options);
  }

  @override
  void onResponse(Response? response, ResponseInterceptorHandler handler) {
    print({
      "data": response?.data,
      "statusCode": response?.statusCode,
      "statusMessage": response?.statusMessage,
    });
    return handler.next(response!);
  }
}
