/// 程序中的错误码
enum Code {
  success(code: 200, msg: '请求成功'),
  failure(code: 1, msg: '请求失败'),
  error(code: -1, msg: '操作失败');

  const Code({required this.code, required this.msg});

  final int code;
  final String msg;
}

/// 统一的实体类
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
