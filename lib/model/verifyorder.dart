import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:roomfinding/model/order.dart';
part 'verifyorder.g.dart';

//model entity for Hostel
@JsonSerializable()
@Entity()
class VerifyOrders {
  @Id(assignable: true) //auto increment
  int oid;
  final Order = ToOne<Orders>;

  @JsonKey(name: 'orderid')
  Orders? orderid;
  DateTime? checkInDate;
  DateTime? checkOutDate;
  String? location;
  String? phone;

  VerifyOrders({
    this.oid = 0,
    this.orderid,
    this.checkInDate,this.checkOutDate,this.location,this.phone
  }); //user constructer

  factory VerifyOrders.fromJson(Map<String, dynamic> json) => _$VerifyOrdersFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOrdersToJson(this);
}

//flutter pub run build_runner build  --delete-conflicting-outputs