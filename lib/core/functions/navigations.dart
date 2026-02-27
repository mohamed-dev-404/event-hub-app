import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void pushTo(Widget newScreen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => newScreen));
  }

  void pushReplacement(Widget newScreen) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => newScreen),
    );
  }

  void pop() {
    Navigator.pop(this);
  }
}
