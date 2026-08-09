import '../widgets/home_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/nav_to.dart';
import '../../../../core/utils/icon_broken.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../settings/presentation/pages/views/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        trailingIcon: IconBroken.Setting,
        onTrailingPressed: () =>
            NavTo.push(context: context, nextPage: const SettingsView()),
      ),
      body: HomeBody(),
    );
  }
}
