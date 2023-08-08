import 'package:path_provider/path_provider.dart';
import '../model/hostel.dart';
import '../model/user.dart';
import '../objectbox.g.dart';

class ObjectBoxInstance {
  late final Store _store;
  late final Box<User> _user;
  late final Box<Hostel> _hostel;

  ObjectBoxInstance(this._store) {
    _user = Box<User>(_store);
    _hostel = Box<Hostel>(_store);
    insertHostel();
  }
  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();

    final store = Store(getObjectBoxModel(), directory: "${dir.path}/userinfo");
    return ObjectBoxInstance(store);
  }

//register user
  int registeruser(User user) {
    return _user.put(user);
  }

//loginuser

  User? loginUser(String username, String password) {
    return _user
        .query(
            User_.Username.equals(username) & User_.password.equals(password))
        .build()
        .findFirst();
  }

  int addHostel(Hostel hostel) {
    return _hostel.put(hostel);
  }

  List<Hostel> getAllHostel() {
    return _hostel.getAll();
  }

  Hostel? gethostelbyHosteLname(String hostelName) {
    return _hostel.query(Hostel_.name.equals(hostelName)).build().findFirst();
  }

  void insertHostel() {
    List<Hostel> lstHostels = getAllHostel();
    if (lstHostels.isEmpty) {
      addHostel(Hostel(
          name: "bagmanihostel",
          type: "boys",
          address: "ghattekulo",
          city: "Kathmandu",
          phone: "9841841372",
          title: "this is title",
          desc: "this is descripton",
          rating: 1,
          cheapestPrice: 500,
          featured: true));

      addHostel(Hostel(
          name: "ragmanihostel",
          type: "girls",
          address: "ghattekulo",
          city: "Kathmandu",
          phone: "9841841372",
          title: "this is title",
          desc: "this is descripton",
          rating: 1,
          cheapestPrice: 500,
          featured: true));
    }
  }
}
