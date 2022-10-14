import 'dart:convert';

import 'package:dms/network/network_utils.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';

Future sendGetRequest(String endpoint) async {
  Response data = await getRequest(endpoint);
  if(data.statusCode == 200){
    var result = await handleResponse(await getRequest(endpoint));
    return result;
  } else {
    if (data.body.isJson()) {
      var data2 = jsonDecode(data.body);
      print(data2);
      toast(data2['message']);
    }
  }
}

Future sendGetrDataRequest(String endpoint, String dataType) async {
  Response data = await getrDataRequest(endpoint);
  if(data.statusCode == 200){
    var result = await handleResponseSingle(data);
    return result["data"]["data"][dataType];
  } else {
    if (data.body.isJson()) {
      var data2 = jsonDecode(data.body);
      print(data2);
      toast(data2['message']);
    }
  }
}

Future sendGetrStateDataRequest(String endpoint) async {
  Response data = await getrDataRequest(endpoint);
  if(data.statusCode == 200){
    var result = await handleResponseSingle(data);
    return result["data"]["state"];
  } else {
    if (data.body.isJson()) {
      var data2 = jsonDecode(data.body);
      print(data2);
      toast(data2['message']);
    }
  }
}

Future sendPostRequest(Map req, String endpoint) async {
  return handleResponse(await postRequest(endpoint, req));
}

