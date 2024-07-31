import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    required this.hintText,
    this.onChanged,
    this.obscureText = true,
    this.icon,
    this.textcontroller,
  }) : super(key: key);

  final String hintText;
  final Function(String)? onChanged;
  final bool obscureText;
  final IconData? icon;
  final TextEditingController? textcontroller;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        cursorColor: AppColors.primaryColor,
        controller: widget.textcontroller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter some text';
          }
          // return null;
        },
        onChanged: widget.onChanged,
        obscureText: widget.obscureText && _obscureText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme!.displaySmall,
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
