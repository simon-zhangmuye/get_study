import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_study/controller/homeController.dart';

class Shop extends StatelessWidget {
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text("Go to Cart"),
                onPressed: () {
                  Get.offNamed('/cart');
                }),
            RaisedButton(
                child: Text("Go back to HomePage"),
                onPressed: () {
                  Get.back();
                }),
          ],
        ),
      ),
    );
  }
}
