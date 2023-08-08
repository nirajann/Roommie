class Constant {
  // static const String baseURL = "http://10.0.2.2:4000/";

  //connection to mobile
  // static const String baseURL = "http://192.168.1.87:4000/";
  //college netwriok
  static const String baseURL = "http://192.168.1.85:4000/";
  //for unit testing
  // static const String baseURL = "http://localhost:4000/";

  // ----------------Student URL----------------
  static const String userLoginURL = "auth/loginuser";
  static const String registerURL = "auth/registeruser";
  static const String hostelURL = "/hostel/";
  static const String orderURL = "/order/createOrder";
  static const String createorderURL = "/order/myorder";
  static const String verifyorderURL = "/verify/verifyOrder";
  static const String deleteORder = "/order/";
  static const String getuser = "/users";
  static const String update = "/users";

  // For storing token or you can store token in shared preferences
  static String token = "";
  static String userID = "";
  static String Productid = "";
}
