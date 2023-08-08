import 'package:objectbox/objectbox.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:roomfinding/model/order.dart';

part 'hostel.g.dart';

//model entity for Hostel
@JsonSerializable()
@Entity()
class Hostel {
  @Id(assignable: true) //auto increment
  int hId;

  @Unique()
  @Index()
  @JsonKey(name: "_id")
  String? hostelid;
  String? name;
  String? type;
  String? address;
  String? city;
  String? phone;
  String? photos;
  String? title;
  String? desc;
  int? rating;
  int? cheapestPrice;
  bool? featured;

  final order = ToMany<Orders>;

  Hostel(
      {this.hostelid,
      this.name,
      this.type,
      this.photos,
      this.address,
      this.cheapestPrice,
      this.city,
      this.desc,
      this.featured,
      this.phone,
      this.rating,
      this.title,
      this.hId = 0}); //user constructer

  factory Hostel.fromJson(Map<String, dynamic> json) => _$HostelFromJson(json);

  Map<String, dynamic> toJson() => _$HostelToJson(this);
}

//flutter pub run build_runner build  --delete-conflicting-outputs