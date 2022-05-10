import 'success.dart';
import 'contents.dart';
import 'copyright.dart';

class Request {
  Success? success;
  Contents? contents;
  String? baseurl;
  Copyright? copyright;

  Request({this.success, this.contents, this.baseurl, this.copyright});

  Request.fromJson(Map<String, dynamic> json) {
    success =
    json['success'] != null ? Success.fromJson(json['success']) : null;
    contents = json['contents'] != null
        ? Contents.fromJson(json['contents'])
        : null;
    baseurl = json['baseurl'];
    copyright = json['copyright'] != null
        ? Copyright.fromJson(json['copyright'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (success != null) {
      data['success'] = success!.toJson();
    }
    if (contents != null) {
      data['contents'] = contents!.toJson();
    }
    data['baseurl'] = baseurl;
    if (copyright != null) {
      data['copyright'] = copyright!.toJson();
    }
    return data;
  }
}