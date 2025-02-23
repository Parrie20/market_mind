import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/services/api_service.dart';

class ChatInputWidget extends StatelessWidget {

  
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApiServiceController());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller.inputQuery,
                decoration: InputDecoration(
                  hintText: 'Type your query here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () async{

               await controller.sendQueryToDb(controller.inputQuery.text); 
              },
            ),
          ],
        ),
      ),
    );
  }
}