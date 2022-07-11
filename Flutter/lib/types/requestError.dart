import 'dart:convert';

class RequestError {
  int? status;
  Response? response;

  RequestError({this.status, this.response});

  RequestError.decode(String err) {
    var errJson = err.replaceAll("Exception: ", "");
    Map<String, dynamic> json = jsonDecode(errJson);

    status = json['status'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  String? message;

  Response({this.message});

  Response.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}

class HandleError {
  String error;

  HandleError(this.error);

  @override
  toString() {
    return error.replaceAll("Exception: ", "");
  }
}
