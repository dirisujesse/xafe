import 'package:xafe/models/podos/token.dart';
import 'package:xafe/services/storage/storage_service.dart';

class XfTokenManager {
  final XfTokenModel _data = XfTokenModel(
    accessToken: null,
    refreshToken: null,
    createdAt: null,
    mobileNumber: null,
  );

  static XfTokenManager? _instance;

  static XfTokenManager get instance {
    if (_instance == null) {
      _instance = XfTokenManager();
    }
    return _instance!;
  }

  setToken({
    required String? accessToken,
    required String? refreshToken,
    required String? mobileNumber,
  }) {
    _data
      ..accessToken = accessToken ?? _data.accessToken
      ..refreshToken = refreshToken ?? _data.refreshToken
      ..mobileNumber = mobileNumber != null ? mobileNumber : _data.mobileNumber
      ..createdAt = DateTime.now();
    LocalStorage.setItems(_data.toJson());
  }

  clearTokens() {
    LocalStorage.removeItems([
      LocalStorage.accessToken,
      LocalStorage.tokenCreationTime,
      LocalStorage.refreshToken,
      LocalStorage.mobileNumber,
    ]);
    LocalStorage.setItems({LocalStorage.isLoggedIn: false});
  }

  bool get userIsLoggedIn {
    final loginStatus = LocalStorage.getItem(
      LocalStorage.isLoggedIn,
      defaultValue: false,
    );
    return loginStatus == true;
  }

  DateTime get _now {
    return DateTime.now();
  }

  bool get shouldRefreshToken {
    try {
      final _tokens = tokens;
      if (_tokens.accessToken == null) return false;
      return _now.difference(_tokens.createdAt ?? _now).inMinutes >= 5;
    } catch (e) {
      return false;
    }
  }

  XfTokenModel get tokens {
    final createdAt = LocalStorage.getItem(LocalStorage.tokenCreationTime);
    return XfTokenModel(
      mobileNumber: LocalStorage.getItem(LocalStorage.mobileNumber) as String?,
      accessToken: LocalStorage.getItem(LocalStorage.accessToken) as String?,
      refreshToken: LocalStorage.getItem(LocalStorage.refreshToken) as String?,
      createdAt: DateTime.tryParse((createdAt ?? "") as String),
    );
  }

  updateCreatedAt() {
    LocalStorage.setItem(
      key: LocalStorage.tokenCreationTime,
      value: DateTime.now().toIso8601String(),
    );
  }
}
