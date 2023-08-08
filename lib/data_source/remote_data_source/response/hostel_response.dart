import 'package:json_annotation/json_annotation.dart';
import '../../../model/hostel.dart';
part 'hostel_response.g.dart';

@JsonSerializable()
class HostelResponse {
  bool? success;
  String? message;
  List<Hostel>? data;

  HostelResponse({this.success, this.message, this.data});

  factory HostelResponse.fromJson(Map<String, dynamic> json) =>
      _$HostelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HostelResponseToJson(this);
}
