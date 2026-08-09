import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double padding;
  final Widget? leading;
  final String? subtitle;
  final Widget? trailing;
  final Gradient? gradient;
  final Color? backgroundColor;
  const CustomAppBar({
    super.key,
    this.leading,
    this.subtitle,
    this.trailing,
    this.gradient,
    required this.title,
    this.backgroundColor,
    this.padding = 12,
  });

  @override
  Widget build(BuildContext context) {
    double padding = this.padding.w;
    var topPadding = MediaQuery.of(context).padding.top;
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        color: backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
      ),
      child: ListTile(
        leading: leading,
        trailing: trailing,
        horizontalTitleGap: 12.w,
        subtitle: _buildSubtitle(),
        tileColor: Colors.transparent,
        visualDensity: VisualDensity.standard,
        title: CustomText(text: title, size: 20.sp, type: Type.header),
        contentPadding: EdgeInsetsDirectional.only(
          bottom: 0,
          end: padding.w,
          start: padding.w,
          top: topPadding - 9.h,
        ),
      ),
    );
  }

  Widget? _buildSubtitle() {
    if (subtitle == null) return null;
    return CustomText(
      text: subtitle!,
      size: 16.sp,
      type: Type.overMedium,
      opacity: FontOpacity.medium,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(subtitle == null ? 64.h : 72.h);
}
