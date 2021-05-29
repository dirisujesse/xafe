class SmsVerificationRequestModel {
  String phone;
  int code;

  SmsVerificationRequestModel({required this.phone, required this.code});

  SmsVerificationRequestModel.fromJson(Map json)
      : phone = json['phone'],
        code = json['code'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['code'] = this.code;
    return data;
  }
}
