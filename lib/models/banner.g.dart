// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner()
  ..id = json['id'] as String
  ..mediaType = json['mediaType'] as num
  ..title = json['title'] as String?
  ..imageUrl = json['imageUrl'] as String?
  ..videoUrl = json['videoUrl'] as String?
  ..redirectType = json['redirectType'] as String?
  ..redirectId = json['redirectId'] as String?
  ..redirectUrl = json['redirectUrl'] as String?
  ..showDetailText = json['showDetailText'] as String?
  ..liveTitle = json['liveTitle'] as String?
  ..remark = json['remark'] as String?
  ..order = json['order'] as num;

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'id': instance.id,
      'mediaType': instance.mediaType,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'videoUrl': instance.videoUrl,
      'redirectType': instance.redirectType,
      'redirectId': instance.redirectId,
      'redirectUrl': instance.redirectUrl,
      'showDetailText': instance.showDetailText,
      'liveTitle': instance.liveTitle,
      'remark': instance.remark,
      'order': instance.order,
    };
