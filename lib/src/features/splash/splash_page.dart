import 'package:app_animesticker/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Navigator.popAndPushNamed(context, '/home');
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstantsDark.colorPrimary,
        elevation: 0,
      ),
      body: Container(
        color: ColorsConstantsDark.colorPrimary,
      ),
    );
  }
}
