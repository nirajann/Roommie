
import 'package:roomfinding/data_source/remote_data_source/hostel_data_source.dart';
import 'package:roomfinding/model/hostel.dart';

abstract class HostelRepository {
  Future<List<Hostel>> getAllHostel();
}

class HostelRepositoryImpl extends HostelRepository {
  @override
  Future<List<Hostel>> getAllHostel() async {
    bool status = true;
    List<Hostel> lsthostel = [];
    if (status) {
      lsthostel = await HostelRemoteDataSource().getAllHostel();
      return lsthostel;
    }
  }

  Future<List<Hostel>> gethostel(Hostel hostelid ) async {
    bool status = true;
    List<Hostel> lsthostel = [];
    if (status) {
      lsthostel = await HostelRemoteDataSource().getAllHostel();
      return lsthostel;
    }
  }
  
}
