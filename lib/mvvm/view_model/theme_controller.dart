import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController with SingleGetTickerProviderMixin {
  final String _key = 'isDarkMode';
  final RxBool isDarkMode = false.obs;
  AnimationController? animationController;
  Animation<double>? scaleAnimation;
  Animation<double>? rotationAnimation;
  Animation<Color?>? glowAnimation;
  Animation<Offset>? slideAnimation;
  Animation<double>? fadeAnimation;

  @override
  void onInit() {
    super.onInit();
    initializeTheme();
    _setupAnimations();
  }

  Future<void> initializeTheme() async {
    isDarkMode.value = await _loadThemeFromPrefs();
  }

  void _setupAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    scaleAnimation = Tween<double>(begin: 1.0, end: 1.3).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.elasticOut,
      ),
    );

    rotationAnimation = Tween<double>(begin: 0, end: 0.7).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.easeInOutBack,
      ),
    );

    glowAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.yellowAccent.withOpacity(0.8),
    ).animate(animationController!);

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeInOutCubic,
    ));

    fadeAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController!,
        curve: Curves.easeInOut,
      ),
    );

    if (isDarkMode.value) {
      animationController!.value = 1.0;
    }
  }

  Future<bool> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  Future<void> toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    await _saveThemeToPrefs(isDarkMode.value);
    Get.changeThemeMode(theme);

    // Play vibrant animation with bottom-to-top transition
    animationController!
      ..reset()
      ..forward().then((_) {
        animationController!.reverse(from: 0.9);
      });
  }

  Future<void> _saveThemeToPrefs(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDarkMode);
  }

  @override
  void onClose() {
    animationController?.dispose();
    super.onClose();
  }

  Widget buildThemeToggleButton() {
    return Obx(
          () => AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) {
          return SlideTransition(
            position: slideAnimation!,
            child: FadeTransition(
              opacity: fadeAnimation!,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: glowAnimation!.value ?? Colors.transparent,
                      blurRadius: 25,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..scale(scaleAnimation!.value)
                    ..rotateZ(rotationAnimation!.value),
                  child: IconButton(
                    icon: Icon(
                      isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                      color: isDarkMode.value ? Colors.amber : Colors.blueGrey,
                      size: 34,
                    ),
                    onPressed: toggleTheme,
                    splashRadius: 30,
                    tooltip: 'Toggle Theme',
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
