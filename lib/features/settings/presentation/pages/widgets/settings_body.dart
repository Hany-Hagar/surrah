import 'package:flutter/material.dart';
import '../../../model/settings_item_model.dart';
import '../../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: settings.length,
      itemBuilder: (context, index) {
        final item = settings[index];
        return _SettingsItem(
          icon: item.icon,
          color: item.color,
          onTap: item.onTap,
          title: item.title,
          subtitle: item.subtitle,
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;
  final String subtitle;
  final VoidCallback onTap;
  const _SettingsItem({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      minTileHeight: 60.h,
      minVerticalPadding: 0,
      horizontalTitleGap: 10.w,
      contentPadding: EdgeInsets.all(8.w),
      tileColor: Theme.of(context).cardColor,
      leading: _Leading(icon: icon, color: color),
      title: CustomText(text: title, size: 16.sp, type: Type.header),
      trailing: Icon(Icons.arrow_forward_ios, size: 18.sp, color: Colors.grey),
      subtitle: CustomText(
        size: 14.sp,
        text: subtitle,
        type: Type.overMedium,
        opacity: FontOpacity.medium,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(color: color.withAlpha(30), width: 1),
      ),
    );
  }
}

class _Leading extends StatelessWidget {
  final Color color;
  final IconData icon;
  const _Leading({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Icon(icon, color: color, size: 25.sp),
    );
  }
}
