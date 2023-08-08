// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      oid: json['oid'] as int? ?? 0,
      orderid: json['_id'] as String?,
      userr: json['userid'] == null
          ? null
          : User.fromJson(json['userid'] as Map<String, dynamic>),
      hostels: json['Hostelid'] == null
          ? null
          : Hostel.fromJson(json['Hostelid'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'oid': instance.oid,
      '_id': instance.orderid,
      'userid': instance.userr,
      'Hostelid': instance.hostels,
    };
