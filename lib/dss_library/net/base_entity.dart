const int netSuccessCode = 200;
const int netFailureCode = 1;

class BaseEntity {
  BaseEntity(this.code, this.msg, this.data);

  // 后台返回的状态码（0：成功 其他：失败）
  late int code;
  String? msg;
  dynamic data;

  factory BaseEntity.fromJson(Map<String, dynamic> json) => BaseEntity(
      json['code'] as int, json['msg'] as String?, json['data'] as dynamic);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'msg': msg,
        'data': data,
      };
}
