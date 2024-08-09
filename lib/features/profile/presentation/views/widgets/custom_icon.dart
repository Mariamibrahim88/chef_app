import 'package:chef_app/core/utils/app_spacing.dart';
import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon(
      {super.key,
      required this.text,
      required this.icon,
      required this.confirmAction});

  final String text;
  final VoidCallback confirmAction;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: confirmAction,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          horizontalSpace(12),
          Text(
            text,
            style: regularStyle(),
          )
        ],
      ),
    );
  }
}
