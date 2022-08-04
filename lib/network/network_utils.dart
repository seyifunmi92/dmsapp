import 'dart:convert';

import 'package:dms/auth/get_token.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'config.dart';

Map buildHeader() {
  return {
    'Content-Type': 'application/json',
    "Accept": "application/json",
  };
}

Future<Response> postRequest(String endPoint, body) async {

  Map<String, String> headers = {
    "Content-Type": "application/json",
  "Accept": "application/json",
  };

  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = "$baseURL$endPoint";

    print('URL: $url');
    print('Request: $body');

    Response response = await post(Uri.parse(url), body: jsonEncode(body), headers:headers).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

    print('Status: ${response.statusCode} $url $body');
    print(response.body);
    return response;
  } catch (e) {
    print(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}


Future<Response> postRequestWithToken(String endPoint, body) async {

  String _token = await getUserToken();

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $_token",
  };

  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = "$baseURL$endPoint";

    print('URL: $url');
    print('Request: $body');

    Response response = await post(Uri.parse(url), body: jsonEncode(body), headers:headers).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

    print('Status: ${response.statusCode} $url $body');
    print(response.body);
    return response;
  } catch (e) {
    print(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}

Future<Response> getRequest(String endPoint) async {

  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = '$baseURL$endPoint';

    Response response = await get(Uri.parse(url)).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

    print('Code: ${response.statusCode} $url');
    print(response.body);
    return response;
  } catch (e) {
    print(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}

Future<Response> getRequestWithToken(String endPoint) async {

  String _token = await getUserToken();
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $_token",
  };

  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = '$baseURL$endPoint';

    Response response = await get(Uri.parse(url), headers: headers).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

    print('Code: ${response.statusCode} $url');
    print(response.body);
    return response;
  } catch (e) {
    print(e);
    if (!await isNetworkAvailable()) {
      throw noInternetMsg;
    } else {
      throw "Please try again";
    }
  }
}

Future handleResponse(Response response) async {
  if (response.statusCode.isSuccessful()) {
    // Map<String, dynamic> userdata = Map<String, dynamic>.from(json.decode(response.body));
    return jsonDecode(response.body) as List;
    // return userdata;
  } else {
    if (response.body.isJson()) {
      throw jsonDecode(response.body);
    } else {
      if (!await isNetworkAvailable()) {
        throw noInternetMsg;
      } else {
        throw 'Please try again';
      }
    }
  }
}

Future handleResponseSingle(Response response) async {
  if (response.statusCode.isSuccessful()) {
    return jsonDecode(response.body);
  } else {
    if (response.body.isJson()) {
      throw jsonDecode(response.body);
    } else {
      if (!await isNetworkAvailable()) {
        throw noInternetMsg;
      } else {
        throw 'Please try again';
      }
    }
  }
}
