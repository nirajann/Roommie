// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hostel _$HostelFromJson(Map<String, dynamic> json) => Hostel(
      hostelid: json['_id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      photos: json['photos'] as String?,
      address: json['address'] as String?,
      cheapestPrice: json['cheapestPrice'] as int?,
      city: json['city'] as String?,
      desc: json['desc'] as String?,
      featured: json['featured'] as bool?,
      phone: json['phone'] as String?,
      rating: json['rating'] as int?,
      title: json['title'] as String?,
      hId: json['hId'] as int? ?? 0,
    );

Map<String, dynamic> _$HostelToJson(Hostel instance) => <String, dynamic>{
      'hId': instance.hId,
      '_id': instance.hostelid,
      'name': instance.name,
      'type': instance.type,
      'address': instance.address,
      'city': instance.city,
      'phone': instance.phone,
      'photos': instance.photos,
      'title': instance.title,
      'desc': instance.desc,
      'rating': instance.rating,
      'cheapestPrice': instance.cheapestPrice,
      'featured': instance.featured,
    };
