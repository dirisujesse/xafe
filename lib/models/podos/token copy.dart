class XfTokenModel {
  String? accessToken;
  String? refreshToken;
  String? mobileNumber;
  DateTime? createdAt;

  XfTokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.createdAt,
    this.mobileNumber,
  });

  toJson() {
    return {
      "accessToken": accessToken,
      "mobileNumber": mobileNumber,
      "refreshToken": refreshToken,
      "createdAt": createdAt?.toIso8601String(),
    };
  }
}
