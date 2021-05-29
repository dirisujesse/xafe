import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:xafe/models/http/response/error/error_response.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

num? extractAmount(String? amount) {
  if (amount == null || amount.isEmpty) {
    return null;
  } else {
    final val = amount.startsWith("NGN") ? amount.substring(3) : amount;
    final number = num.tryParse(val.replaceAll(RegExp(r'[^0-9\.]'), ""));
    if (number != null) {
      return number;
    } else {
      return number;
    }
  }
}

String lower(String text) => text.toLowerCase();

bool contains(String base, String comparator) =>
    lower(base).contains(lower(comparator));

String getTimeFromDuration(Duration duration) {
  final durationString = duration.toString().split(".").first;
  final hourMinSec = durationString.split(":");
  String length = "";
  hourMinSec.forEach((it) {
    final isFirst = hourMinSec.indexOf(it) == 0;
    final trailing = it != hourMinSec.last ? ":" : "";
    if (!isFirst && it != "0") {
      length += it.length == 1 ? "0$it$trailing" : "$it$trailing";
    }
  });
  return length;
}

String parseError(
  dynamic errorData,
  String? defaultMessage, [
  bool ignore401 = false,
]) {
  final errorResponse =
      errorData is HttpErrorResponse ? errorData.toJson() : errorData;
  print("xxxx: $errorResponse");
  try {
    final fallbackMessage = defaultMessage != null && defaultMessage.isNotEmpty
        ? defaultMessage
        : "Your request failed due to an unexpected error, please try again";
    try {
      final int statusCode = errorResponse["statusCode"] ?? 400;
      final dynamic error = errorResponse["data"];

      if (error is Map) {
        if (error["message"] != null &&
            error["message"] is String &&
            error["message"].isNotEmpty) {
          return error["message"];
        } else if (error.containsKey("errors") && error["errors"] != null) {
          return _parseErrorArray(error["errors"]) ??
              _fallBackMessage(
                  statusCode,
                  defaultMessage ??
                      "Your request failed due to an unexpected error, please try again");
        } else {
          return _fallBackMessage(statusCode, fallbackMessage);
        }
      }
      if (error is String?) {
        return error != null && error.isNotEmpty
            ? error
            : _fallBackMessage(statusCode, fallbackMessage);
      }
      return _fallBackMessage(statusCode, fallbackMessage);
    } catch (_) {
      return fallbackMessage;
    }
  } catch (_) {
    return defaultMessage ??
        "Your request failed due to an unexpected error, please try again";
  }
}

String parseSuccess(dynamic data, String? defaultMessage) {
  final fallbackMessage = defaultMessage != null && defaultMessage.isNotEmpty
      ? defaultMessage
      : "Success";
  try {
    if (data is Map) {
      if (data["message"] != null &&
          data["message"] is String &&
          data["message"].isNotEmpty) {
        return data["message"];
      }
      return fallbackMessage;
    }
    return fallbackMessage;
  } catch (_) {
    return fallbackMessage;
  }
}

String? _parseErrorArray(Map error) {
  try {
    final data = Map<String, List>.from(error);
    List errorMessages = [];
    data.keys.forEach((it) {
      errorMessages.addAll(data[it]!);
    });
    return errorMessages.join(", ");
  } catch (_) {
    return null;
  }
}

String _fallBackMessage(int statusCode, String defaultMessage) {
  if (statusCode == 405) {
    return "Sorry, you are not permitted to carry out this action at this time";
  } else if (statusCode == 404) {
    return "Sorry, the requested data could not be found at this time";
  } else if (statusCode == 401) {
    return "Unauthorized";
  } else if (statusCode >= 400 && statusCode < 500) {
    return "Sorry, your request could not be resolved at this time, please retry";
  } else if (statusCode >= 500 && statusCode < 600) {
    return "Sorry, your request could not be resolved at this time because of an unexpected error";
  } else {
    return defaultMessage;
  }
}

Future<File?> exractFile(Map<String, String> data) async {
  try {
    final byteArray = base64Decode(data['b64'] ?? "");
    final file = File("${data['path']}/avatar.png");
    await file.writeAsBytes(byteArray);
    return file;
  } catch (_) {
    return null;
  }
}
