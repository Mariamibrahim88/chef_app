import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            const TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            TextSpan(
              text: ' Sign Up',
              style: boldStyle().copyWith(color: Colors.grey, fontSize: 19),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //GoRouter.of(context).push('/registerView');
                },
            )
          ])),
    );
  }
}
