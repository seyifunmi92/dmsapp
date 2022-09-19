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

Uri buildBaseUrl(String endPoint) {
  Uri url = Uri.parse(endPoint);
  if (!endPoint.startsWith('http')) url = Uri.parse('$baseURL$endPoint');

  log('URL: ${url.toString()}');

  return url;
}

Future<Response> postRequest(String endPoint, body) async {

  Map<String, String> headers = {
    "Content-Type": "application/json",
  "Accept": "application/json",
  };

  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    // String url = "$baseURL$endPoint";
    Uri url = buildBaseUrl(endPoint);
    print('URL: $url');
    print('Request: $body');

    Response response = await post(url, body: jsonEncode(body), headers:headers).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

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

    // String url = "$baseURL$endPoint";
    Uri url = buildBaseUrl(endPoint);

    print('URL: $url');
    print('Request: $body');

    Response response = await post(url, body: jsonEncode(body), headers:headers).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

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

    // String url = '$baseURL$endPoint';
    Uri url = buildBaseUrl(endPoint);

    Response response = await get(url).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

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

Future<Response> getrDataRequest(String endPoint) async {

  var Url = "https://dms-rdata-ms.azurewebsites.net/api/v1";

  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    String url = '$Url$endPoint';

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

  print(getUserToken());
  String _token = await getUserToken(); // "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJDbGllbnQyMDAiLCJqdGkiOiI2NjQyNTVmYS0xNzMzLTQ2YTEtOTRhOC0zYzdjNTUzODM0ZjkiLCJpYXQiOjE2NjMwNjk0NTIsInJvbGUiOiJEaXN0cmlidXRvciIsInVzZXJJZCI6IjYiLCJ1c2VybmFtZSI6IkNsaWVudDIwMCIsImZpcnN0TmFtZSI6IkVqaW9mb3IiLCJsYXN0TmFtZSI6IkNoaWt1bSIsImVtYWlsQWRkcmVzcyI6ImNoaWthLmVqaW9mb3JAdmVycmFraS5jb20iLCJwaG9uZU51bWJlciI6IjA4MTA5NjU4ODA1IiwibmJmIjoxNjYzMDY5NDUxLCJleHAiOjE2NzM0Mzc0NTEsImlzcyI6IklkZW50aXR5IiwiYXVkIjoiSWRlbnRpdHlVc2VyIn0.wCm0PUGTheYzAFlNL5CiT1QdGuuDfO6CiO6CKb6zHzE"; //await getUserToken();
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $_token",
  };

  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    // String url = '$baseURL$endPoint';
    Uri url = buildBaseUrl(endPoint);

    Response response = await get(url, headers: headers).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

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


Future<Response> putRequestWithToken(String endPoint, body) async {

  String _token = await getUserToken();

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $_token",
  };

  try {
    if (!await isNetworkAvailable()) throw noInternetMsg;

    // String url = "$baseURL$endPoint";
    Uri url = buildBaseUrl(endPoint);

    print('URL: $url');
    print('Request: $body');

    Response response = await put(url, body: jsonEncode(body), headers:headers).timeout(Duration(seconds: timeoutDuration), onTimeout: (() => throw "Please try again"));

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
