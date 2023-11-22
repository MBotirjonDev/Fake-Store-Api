import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget TextForAppBar({required String title, required double fs}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: fs,
      fontWeight: FontWeight.bold,
    ),
  );
}
