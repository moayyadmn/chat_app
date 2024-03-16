import 'package:flutter/material.dart';

extension SpaceXY on int {
  SizedBox get spaceX => SizedBox(
        width: toDouble(),
      );
  SizedBox get spaceY => SizedBox(
        height: toDouble(),
      );
}


extension FirstName on String {
  String getFirstName() {
    List<String> nameParts = this.split(' ');
    return nameParts[0];
  }
}
