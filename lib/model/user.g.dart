// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['_id'] as String?,
      email: json['email'] as String?,
      Username: json['Username'] as String?,
      password: json['password'] as String?,
      uId: json['uId'] as int? ?? 0,
      pic: json['pic'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uId': instance.uId,
      '_id': instance.userId,
      'email': instance.email,
      'Username': instance.Username,
      'password': instance.password,
      'pic': instance.pic,
    };
