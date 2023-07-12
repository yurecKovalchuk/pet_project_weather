import 'package:flutter/material.dart';

class MainBackgroundDecoration {
  static BoxDecoration backgroundDecoration = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.indigo,
        Color.fromRGBO(0, 0, 60, 1.0),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
  );
}
