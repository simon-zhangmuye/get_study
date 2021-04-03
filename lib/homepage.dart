import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_study/controller/homeController.dart';

class HomePage extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  TextEditingController emailEditingController = TextEditingController();
  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: emailEditingController,
                decoration: InputDecoration(hintText: "Input Email Address"),
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    if (GetUtils.isEmail(emailEditingController.text)) {
                      storage.write("email", emailEditingController.text);
                      emailEditingController.text = '';
                    } else {
                      Get.snackbar("Incorrect Email", "Provide a valid email",
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                  child: Text("View"),
                  onPressed: () {
                    homeController.updateEmail("${storage.read('email')}");
                  }),
              SizedBox(
                height: 50,
              ),
              Obx(() {
                return Text("${homeController.email.value}");
              })
            ]),
      ),
    );
  }
}
