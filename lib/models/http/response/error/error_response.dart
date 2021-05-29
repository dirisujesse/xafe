class HttpErrorResponse {
  int statusCode;
  dynamic data;

  HttpErrorResponse({required this.statusCode, required this.data});

  HttpErrorResponse.fromJson(Map json)
      : statusCode = json['statusCode'],
        data = json['data'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['data'] = this.data;
    return data;
  }
}
