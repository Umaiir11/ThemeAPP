import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/theme_controller.dart';

class ScreenTwo extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Two'),
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
              color: Colors.green,
              margin: EdgeInsets.all(8),
            ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Back to Screen One'),
          ),
        ],
      ),
    );
  }
}
