// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostelResponse _$HostelResponseFromJson(Map<String, dynamic> json) =>
    HostelResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Hostel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HostelResponseToJson(HostelResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
