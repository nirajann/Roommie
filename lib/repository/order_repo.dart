

import '../data_source/remote_data_source/order_data_source.dart';
import '../model/order.dart';

abstract class OrderRepository {
  Future<List<Orders>> getAllOrder();
  Future<int> addHostel(String HostelId);
  Future<List<Orders>> getOrderByUserid();
  Future<int> deleteorder();
}

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<List<Orders>> getAllOrder() async {
    bool status = true;
    List<Orders> lsthostel = [];
    if (status) {
      lsthostel = await OrderRemoteDataSource().getAllCarthostels();
      return lsthostel;
    }
  }

  @override
  Future<List<Orders>> getOrderByUserid() async {
    bool status = true;
    List<Orders> lsthostel = [];
    if (status) {
      lsthostel = await OrderRemoteDataSource().getUserByUserId();
      return lsthostel;
    }
  }

  @override
  Future<int> deleteorder() async {
    bool status = true;
    int lsthostel = 2;
    if (status) {
      lsthostel = await OrderRemoteDataSource().deleteorder();
      return lsthostel;
    }
  }

  @override
  Future<int> addHostel(String hostelId) {
    return OrderRemoteDataSource().addOrderhostel(hostelId);
  }
}
