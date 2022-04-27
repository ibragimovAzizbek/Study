import 'package:studyapp/services/fire_service.dart';

class LogOutService {
  // ? User logOut
  static Future<bool> userLogOut() async {
    try {
      await FireService.auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
}
