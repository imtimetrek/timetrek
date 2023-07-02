import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  //keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userPhoneKey = "USERPHONEKEY";
  static String userGenderKey = "USERGENDERKEY";
  static String userProfessionKey = "USERPROFESSIONKEY";
  static String userPlaceKey = "USERPLACEKEY";



  // saving the data to SF

  static Future<bool> saveUserLoggedInStatus(bool isUserLoggedIn) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setBool(userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSF(String userName) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userNameKey, userName);
  }

  static Future<bool> saveUserEmailSF(String userEmail) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  static Future<bool> saveUserPhoneSF(String userPhone) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userPhoneKey, userPhone);
  }

  static Future<bool> saveUserGenderSF(String userGender) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userGenderKey, userGender);
  }

  static Future<bool> saveUserProfessionSF(String userProfession) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userProfessionKey, userProfession);
  }

  static Future<bool> saveUserPlaceSF(String userProfession) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return await sf.setString(userPlaceKey, userProfession);
  }



  // getting the data from SF

  static Future<bool?> getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }

  static Future<String?> getUserPhoneFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userPhoneKey);
  }

  static Future<String?> getUserGenderFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userGenderKey);
  }

  static Future<String?> getUserProfessionFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userProfessionKey);
  }

  static Future<String?> getUserPlaceFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userPlaceKey);
  }

}