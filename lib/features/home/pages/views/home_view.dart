import 'package:surrah_app/core/widgets/custom_app_bar.dart';

import '../../../../core/utils/icon_broken.dart';
import '../widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        trailingIcon: IconBroken.Setting,
        onTrailingPressed: () {},
      ),
      body: HomeBody(),
    );
  }
}
