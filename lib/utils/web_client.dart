
import 'dart:convert';
import 'dart:io';

import 'package:my_test_appp/utils/pref_manager.dart';
import 'package:http/http.dart' as http;

class ApiServices{
  static  String ip = "http://foodmallapifortesting.pulseerp.co.in/api";
  static  String image_ip = "http://foodmallapifortesting.pulseerp.co.in/api";

  static Future<dynamic> serviceGet(url) async {
    var responseJson;
    try{
      var response = await http.get(
        Uri.parse(ip + url),
        headers: {
          "Content-Type": "application/json",
        },
      );
      print(response.body.toString());

      responseJson = json.decode(response.body.toString());
    }
    on SocketException {
      throw 'Error occurred while Communication with Server';
    }
    return responseJson;
  }

  static Future<dynamic>servicePost(url, data,{unMappedData}) async {
    String? token = await PrefManager.getToken();
    Map sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }
    var body = json.encode(unMappedData ?? sendData);
    var responseJson;
    try {


      final response =  await http.post(Uri.parse(ip + url),
          headers: {
            "Content-Type": "application/json",
          }, body: body);

      print(response.body.toString());

      responseJson = json.decode(response.body.toString());
    } on SocketException {
      throw 'Error occurred while Communication with Server';
    }
    return responseJson;

  }

}