import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:roomfinding/model/hostel.dart';
import 'package:roomfinding/model/user.dart';
import 'package:roomfinding/model/verifyorder.dart';
part 'order.g.dart';

//model entity for Hostel
@JsonSerializable()
@Entity()
class Orders {
  @Id(assignable: true) //auto increment
  int oid;
  final user = ToOne<User>;
  final order = ToOne<VerifyOrders>;

  
  @Unique()
  @Index()
  @JsonKey(name: "_id")
  String? orderid;

  @Backlink()
  final hostel = ToMany<Hostel>;

  @JsonKey(name: 'userid')
  User? userr;

  @JsonKey(name: 'Hostelid')
  Hostel? hostels;

  Orders({
    this.oid = 0,
    this.orderid,
    this.userr,
    this.hostels,
  }); //user constructer

  factory Orders.fromJson(Map<String, dynamic> json) => _$OrdersFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}

//flutter pub run build_runner build  --delete-conflicting-outputs