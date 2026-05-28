class BaseModel {
  BaseModel({this.key, this.msg, this.code});

  BaseModel.fromJson(dynamic json) {
    key = json['key'];
    msg = json['msg'];
    code = json['code'];
  }

  String? key;
  String? msg;
  int? code;
}
