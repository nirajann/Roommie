

import 'package:roomfinding/state/objectboc_state.dart';
import '../../helper/objectbox.dart';
import '../../model/hostel.dart';

class HostelDataSource {
  // Get the objectBox instance from state
  ObjectBoxInstance get objectBoxInstance => ObjectBoxState.objectBoxInstance!;
  // OR
  ObjectBoxInstance objectBoxInstance2 = ObjectBoxState.objectBoxInstance!;



  Future<List<Hostel>> getAllHostel() async {
    try {
      return Future.value(objectBoxInstance.getAllHostel());
    
    } catch (e) {
      return [];
    }
  }
 

 
}
