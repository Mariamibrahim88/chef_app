import 'package:flutter/material.dart';

void navigate(
    {required BuildContext context, required String route, dynamic arg}) {
  Navigator.pushNamed(context, route, arguments: arg);
}

void navigateReplacement(
    {required BuildContext context, required String route, dynamic arg}) {
  Navigator.pushReplacementNamed(context, route, arguments: arg);
}
