import 'package:objectbox/objectbox.dart';
import 'package:roomfinding/data_source/remote_data_source/verifyorder_data_source.dart';


abstract class VerifyOrderRepository {
  Future<int> VerifyOrder(String orderid,DateTime checkInDate,DateTime checkOutDate,String location,String phone);

}

class VerifyOrderRepositoryImpl extends VerifyOrderRepository {
 

  
  
  @override
  Future<int> VerifyOrder(String orderid,DateTime checkInDate,DateTime checkOutDate,String location,String phone) {
    return VerifyOrderRemoteDataSource().addOrderhostel(orderid,checkInDate,checkOutDate,location,phone);
  }
}
