import 'package:shared_preferences/shared_preferences.dart';

getUserToken()async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var _token = _prefs.getString('token');
  print(_token);

  return _token;
}