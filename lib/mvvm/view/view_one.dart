import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/theme_controller.dart';
import 'screen_two.dart';

class ScreenOne extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen One'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          for (int i = 1; i <= 5; i++) Text('Text $i'),
          for (int i = 1; i <= 3; i++)
            Container(
              height: 50,
              width: 50,
              color: Colors.blue,
              margin: EdgeInsets.all(8),
            ),
          ElevatedButton(
            onPressed: () {
              Get.to(ScreenTwo());
            },
            child: Text('Go to Screen Two'),
          ),
        ],
      ),
    );
  }
}
