import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref{


  clearData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print(prefs.hashCode);
  }

  Future<bool> isFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.hashCode);
    bool isFirstTime = prefs.getBool('isFirstTimeUser') ?? true;
    return isFirstTime;
  }

  void storeUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTimeUser', false);

  }
}
