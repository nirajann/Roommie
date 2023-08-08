import 'package:dio/dio.dart';
import 'package:roomfinding/data_source/remote_data_source/response/hostel_response.dart';
import 'package:roomfinding/helper/http_service.dart';

import '../../app/constants.dart';
import '../../model/hostel.dart';

class HostelRemoteDataSource {
  final Dio _httpservices = HttpServices().getDioInstance();

  Future<List<Hostel>> getAllHostel() async {
    try {
      Response response = await _httpservices.get(
        Constant.hostelURL,
      );
      List<Hostel> lstHotels = [];
      if (response.statusCode == 200) {
        HostelResponse hostelResponse = HostelResponse.fromJson(response.data);
        lstHotels = hostelResponse.data!;
        return lstHotels;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


}
