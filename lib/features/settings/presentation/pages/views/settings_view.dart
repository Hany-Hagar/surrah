import '../widgets/settings_body.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/custom_back.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Settings',
        leading: const CustomBackIcon(),
        subtitle: 'Manage your preferences',
      ),
      body: const SettingsBody(),
    );
  }
}