// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifyorder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOrders _$VerifyOrdersFromJson(Map<String, dynamic> json) => VerifyOrders(
      oid: json['oid'] as int? ?? 0,
      orderid: json['orderid'] == null
          ? null
          : Orders.fromJson(json['orderid'] as Map<String, dynamic>),
      checkInDate: json['checkInDate'] == null
          ? null
          : DateTime.parse(json['checkInDate'] as String),
      checkOutDate: json['checkOutDate'] == null
          ? null
          : DateTime.parse(json['checkOutDate'] as String),
      location: json['location'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$VerifyOrdersToJson(VerifyOrders instance) =>
    <String, dynamic>{
      'oid': instance.oid,
      'orderid': instance.orderid,
      'checkInDate': instance.checkInDate?.toIso8601String(),
      'checkOutDate': instance.checkOutDate?.toIso8601String(),
      'location': instance.location,
      'phone': instance.phone,
    };
