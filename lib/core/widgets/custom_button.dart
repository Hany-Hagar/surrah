import 'custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final double? width;
  final double? height;
  final String? text;
  final Color? color;
  final IconData? icon;
  final double itemSize;
  final Function() onPressed;
  final double? borderRadius;
  final bool enableBorderColor;
  final EdgeInsetsGeometry? padding;
  const CustomButton({
    super.key,
    this.isLoading = false,
    this.width,
    this.height,
    this.text,
    this.icon,
    this.color,
    this.itemSize = 20,
    required this.onPressed,
    this.borderRadius,
    this.enableBorderColor = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.sp ?? double.infinity,
      height: (height ?? 55).h,
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _Body(
              text: text,
              icon: icon,
              color: color,
              itemSize: itemSize,
              onPressed: onPressed,
              borderRadius: borderRadius,
              enableBorderColor: enableBorderColor,
              padding: padding,
            ),
    );
  }
}

class _Body extends StatelessWidget {
  final String? text;
  final Color? color;
  final IconData? icon;
  final double itemSize;
  final Function() onPressed;
  final double? borderRadius;
  final bool enableBorderColor;
  final EdgeInsetsGeometry? padding;
  const _Body({
    this.text,
    this.icon,
    this.color,
    required this.itemSize,
    required this.onPressed,
    this.borderRadius,
    this.enableBorderColor = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: enableBorderColor
            ? Theme.of(context).scaffoldBackgroundColor
            : color ?? Theme.of(context).primaryColor,
        shape: _shape(context),
        padding: padding,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            _Icon(
              icon: icon!,
              iconSize: (itemSize + 8).sp,
              color: _itemColor(context),
            ),
          if (icon != null) SizedBox(width: 4.w),
          _Title(
            text: text ?? "",
            textSize: itemSize,
            color: _itemColor(context),
          ),
        ],
      ),
    );
  }

  OutlinedBorder _shape(BuildContext context) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      side: BorderSide(
        color: enableBorderColor
            ? color ?? Theme.of(context).primaryColor
            : Colors.transparent,
        width: 1.0,
      ),
    );
  }

  Color _itemColor(BuildContext context) {
    return enableBorderColor
        ? color ?? Theme.of(context).primaryColor
        : Theme.of(context).scaffoldBackgroundColor;
  }
}

class _Title extends StatelessWidget {
  final String text;
  final double textSize;
  final Color color;
  const _Title({
    required this.text,
    required this.textSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      size: textSize.sp,
      type: Type.overMedium,
      color: color,
    );
  }
}

class _Icon extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color color;
  const _Icon({
    required this.icon,
    required this.iconSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: iconSize.sp, color: color);
  }
}
