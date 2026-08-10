import 'package:flutter/material.dart';
import '../../../core/utils/icon_broken.dart';

class SettingsItemModel {
  final Color color;
  final String title;
  final IconData icon;
  final String subtitle;
  final VoidCallback onTap;
  SettingsItemModel({
    required this.color,
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.onTap,
  });
}

List<SettingsItemModel> settings = [
  SettingsItemModel(
    title: 'Account',
    color: Colors.blue,
    subtitle: 'Manage your account settings',
    icon: IconBroken.Profile,
    onTap: () {
      // Navigate to account settings
    },
  ),
  // Currncy
  SettingsItemModel(
    title: 'Currency',
    subtitle: 'Select your preferred currency',
    color: Colors.green,
    icon: IconBroken.Wallet,
    onTap: () {
      // Navigate to currency settings
    },
  ),
  SettingsItemModel(
    title: 'Language',
    subtitle: 'Choose your preferred language',
    color: Colors.orange,
    icon: IconBroken.Discovery,
    onTap: () {
      // Navigate to language settings
    },
  ),
  SettingsItemModel(
    title: 'Theme',
    subtitle: 'Select your preferred theme',
    color: Colors.purple,
    icon: IconBroken.Activity,
    onTap: () {
      // Navigate to theme settings
    },
  ),
  SettingsItemModel(
    title: 'Notifications',
    subtitle: 'Manage your notification preferences',
    color: Colors.red,
    icon: IconBroken.Notification,
    onTap: () {
      // Navigate to notification settings
    },
  ),
  SettingsItemModel(
    title: 'Privacy',
    subtitle: 'Manage your privacy settings',
    color: Colors.teal,
    icon: IconBroken.Lock,
    onTap: () {
      // Navigate to privacy settings
    },
  ),
  SettingsItemModel(
    title: 'About',
    subtitle: 'Learn more about the app',
    color: Colors.grey,
    icon: IconBroken.Info_Circle,
    onTap: () {
      // Navigate to about page
    },
  ),
  SettingsItemModel(
    title: 'Help & Support',
    subtitle: 'Get help and support',
    color: Colors.brown,
    icon: IconBroken.Call,
    onTap: () {
      // Navigate to help and support page
    },
  ),
  SettingsItemModel(
    title: 'Delete Account',
    subtitle: 'Permanently delete your account',
    color: Colors.redAccent,
    icon: IconBroken.Delete,
    onTap: () {
      // Handle delete account
    },
  ),
];
