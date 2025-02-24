import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class ApiServiceController extends GetxController{
  static ApiServiceController get instance => Get.find();
  
  final inputQuery = TextEditingController();
    var responseMessage = ''.obs;
  var data = <String, dynamic>{}.obs; // ✅ Explicitly define as RxMap<String, dynamic>


  Future<String> fetchData() async {
    // Replace with actual API logic
    await Future.delayed(Duration(seconds: 2));
    return 'Sales Data fetched';
  }


  Future<void> sendQueryToDb(String query) async {
    try {
      var url = Uri.parse("http://192.168.1.10:5000/query");
      print('Fetching');

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"query": query}),
      );

      print('Fetch?');

      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse is Map<String, dynamic>) {
          data.value = jsonResponse;
          update();// ✅ Ensure correct type assignment
        } else {
          responseMessage.value = "Invalid response format";
        }

        print(data.value);
      } else {
        responseMessage.value = "Error: ${response.statusCode}";
      }
    } catch (e) {
      responseMessage.value = "Retry Later: $e";  // ✅ Proper error message
    }
  }

}
