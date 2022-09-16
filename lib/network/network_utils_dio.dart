//
// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:dms/network/config.dart';
// import 'package:nb_utils/nb_utils.dart';
//
// import '../auth/get_token.dart';
//
// Future<Response> getRequestDio(String endPoint)async
// {
//   if (!await isNetworkAvailable()) throw noInternetMsg;
//
// try{
//
//
//   } catch (e) {
//     print(e);
//     if (!await isNetworkAvailable()) {
//     throw noInternetMsg;
//     } else {
//     throw "Please try again";
//     }
//   }
// }
//
// Future<Response> postRequestDio(String endPoint, body) async
// {
//   if (!await isNetworkAvailable()) throw noInternetMsg;
//
//   try{
//
//
//
//   } catch (e) {
//     print(e);
//     if (!await isNetworkAvailable()) {
//       throw noInternetMsg;
//     } else {
//       throw "Please try again";
//     }
//   }
//
// }
//
// Future<Response> postRequestWithTokenDio() async {
//
//   String _token = await getUserToken();
//
//   Map<String, String> headers = {
//     "Content-Type": "application/json",
//     "Accept": "application/json",
//     "Authorization": "Bearer $_token",
//   };
//
//   try{
//
//   }catch (e){
//     if (!await isNetworkAvailable()) {
//       throw noInternetMsg;
//     } else {
//       throw "Please try again";
//     }
//   }
//
// }
//
// Future<Response> getRequestWithTokenDio() async {
//
//   String _token = await getUserToken();
//   Map<String, String> headers = {
//     "Content-Type": "application/json",
//     "Accept": "application/json",
//     "Authorization": "Bearer $_token",
//   };
//
//   try{
//
//   }catch (e){
//     if (!await isNetworkAvailable()) {
//       throw noInternetMsg;
//     } else {
//       throw "Please try again";
//     }
//   }
// }
//
// Future handleResponse(Response response) async {
//   if (response.statusCode.isSuccessful()) {
//     // Map<String, dynamic> userdata = Map<String, dynamic>.from(json.decode(response.body));
//     return jsonDecode(response.data) as List;
//     // return userdata;
//   } else {
//     if (response.data.isJson()) {
//       throw jsonDecode(response.data);
//     } else {
//       if (!await isNetworkAvailable()) {
//         throw noInternetMsg;
//       } else {
//         throw 'Please try again';
//       }
//     }
//   }
// }
//
// Future handleResponseSingle(Response response) async {
//   if (response.statusCode.isSuccessful()) {
//     return jsonDecode(response.data);
//   } else {
//     if (response.data.isJson()) {
//       throw jsonDecode(response.data);
//     } else {
//       if (!await isNetworkAvailable()) {
//         throw noInternetMsg;
//       } else {
//         throw 'Please try again';
//       }
//     }
//   }
// }
