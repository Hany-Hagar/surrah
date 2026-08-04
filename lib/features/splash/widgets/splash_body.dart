import '../../../const/aseets.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.splashLogo,
      width: MediaQuery.of(context).size.width * 0.45,
    );
  }
}
