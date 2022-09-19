import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInBloc extends ChangeNotifier {
  LogInBloc() {
    checkSignIn();
    getLoggedInToken();
    getDeviceId();
    getIPAddress();
  }

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _isOnboardingRead = false;
  bool get isOnboardingRead => _isOnboardingRead;

  String? _userData;
  String? get userData => _userData;

  String? _userData2;
  String? get userData2 => _userData;

  String? _token;
  String? get token => _token;

  String? _otpID;
  String? get otpID => _otpID;

  String? _registrationID;
  String? get registrationID => _registrationID;

  String? _resetToken;
  String? get resetToken => _resetToken;

  String _deviceID = "";
  String get deviceID => _deviceID;

  String _ipAddress = "";
  String get ipAddress => _ipAddress;

  Future saveLoggedInToken(String userToken) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('token', userToken);
    _token = userToken;
    notifyListeners();
  }

  Future getuserData(String firstName) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('firstname', firstName);
    _userData = firstName;
    notifyListeners();
  }

  Future getuserData2(String lastName) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('lastname', lastName);
    _userData2 = lastName;
    notifyListeners();
  }

  Future saveRegistrationID(String regID) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('registrationID', regID);
    _registrationID = regID;
    notifyListeners();
  }

  Future saveResetToken(String token) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('resetToken', token);
    _resetToken = token;
    notifyListeners();
  }

  Future saveOtpId(String otpID) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('otpid', otpID);
    _otpID = otpID;
    notifyListeners();
  }

  Future getDeviceId() async {
    try {
      final deviceid = await PlatformDeviceId.getDeviceId;
      _deviceID = deviceid!;
      notifyListeners();
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  getSharedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? firstname = sharedPreferences.getString("firstname");
    String? lastname = sharedPreferences.getString("lastname");
    var userName = firstname! + " " + lastname!;
    print(userName);
    return userName;
  }

  Future getIPAddress() async {
    try {
      /// Initialize Ip Address
      var ipAddress = IpAddress(type: RequestType.json);

      /// Get the IpAddress based on requestType.
      dynamic data = await ipAddress.getIpAddress();
      print(data["ip"].toString());
      _ipAddress = data["ip"].toString();
      notifyListeners();
    } on IpAddressException catch (exception) {
      /// Handle the exception.
      print(exception.message);
    }
  }

  Future getLoggedInToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _token = sp.getString('token');
    notifyListeners();
  }

  Future getOtpIdToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _otpID = sp.getString('otpid');
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('signed_in', true);
    _isSignedIn = true;
    notifyListeners();
  }

  void checkSignIn() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _isSignedIn = sp.getBool('signed_in') ?? false;
    notifyListeners();
  }

  Future setOnboarding() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isOnboardingRead', true);
    _isOnboardingRead = true;
    notifyListeners();
  }

  void checkOnboardingRead() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _isOnboardingRead = sp.getBool('isOnboardingRead') ?? false;
    notifyListeners();
  }

  Future userSignout() async {
    await clearAllLoggedData().then((value) {
      _isSignedIn = false;
      _token = null;
      notifyListeners();
    });
  }

  Future clearAllLoggedData() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove("signed_in");
    sp.remove("token");
  }
}
