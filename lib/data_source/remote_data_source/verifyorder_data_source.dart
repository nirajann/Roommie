import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../app/constants.dart';
import '../../helper/http_service.dart';

class VerifyOrderRemoteDataSource {
  final Dio _httpservices = HttpServices().getDioInstance();

  Future<int> addOrderhostel(String orderid, DateTime checkInDate,
      DateTime checkOutDate, String location, String phone) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString('token')!;

      Response response = await _httpservices.post(
        Constant.verifyorderURL,
        queryParameters: {
          'orderid': orderid,
          'checkInDate': checkInDate,
          'checkOutDate': checkOutDate,
          'location': location,
          'phone': phone
        },
        options: Options(
          headers: {
            "Authorization": token,
          },
        ),
      );
      if (response.statusCode == 200) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }
}

void addProductid(String Productid) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString('_id', Productid);

  // await pref.setString('login', token);
}
