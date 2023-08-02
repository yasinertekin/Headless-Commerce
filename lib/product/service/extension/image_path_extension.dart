import 'package:flutter/material.dart%20';
import 'package:headless_commerce/view/welcome_screen.dart';

extension ImagePathsExtension on ImagePaths {
  String path() {
    return 'assets/images/$name.png';
  }

  Widget toWidget({double height = 300}) {
    return Image.asset(path(), height: height);
  }
}
