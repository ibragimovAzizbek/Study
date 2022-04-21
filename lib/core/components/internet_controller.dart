import 'package:connectivity_plus/connectivity_plus.dart';

class InternetController {
  static Future get internetController async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      print("I am connected to a mobile network.");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      print('I am connected to a wifi network');
    } else {
      print("Error internet");
    }
  }
}
