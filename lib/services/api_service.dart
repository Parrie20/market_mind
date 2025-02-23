import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class ApiServiceController extends GetxController{
  final String url = 'http://192.168.1.10:5000/query';
  
  final inputQuery = TextEditingController();

  Future<String> fetchData() async {
    // Replace with actual API logic
    await Future.delayed(Duration(seconds: 2));
    return 'Sales Data fetched';
  }


  Future<void> sendQueryToDb(String query)async{
    try{
     final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"query": query}), 
    );

    if(response.statusCode == 200){
      
      final data = response.body;
      print(data);
    }




    }catch(e){
throw 'Retry Later $e';
    }
  }
}
