import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref{


  clearData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<bool> isFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTimeUser') ?? true;
    return isFirstTime;
  }

  void storeUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTimeUser', false);

  }
}
