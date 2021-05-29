import 'package:xafe/services/http/auth/auth_contract.dart';
import 'package:xafe/services/http/base_http.dart';
import 'package:xafe/services/mixins/base_http_mixin.dart';

class AuthHttpService extends XfHttpService
    with XfHttpMixin
    implements AuthService {
  AuthHttpService() : super(collectionUrl: "/auth");
}
