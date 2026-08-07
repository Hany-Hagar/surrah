import 'package:flutter/material.dart';
import '../../manager/setup_cubit.dart';
import 'package:easy_stepper/easy_stepper.dart';
import '../../../../core/utils/icon_broken.dart';
import '../../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupBody extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> childern;
  final EdgeInsetsGeometry? padding;
  const SetupBody({
    super.key,
    this.padding,
    required this.title,
    required this.subtitle,
    required this.childern,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  _Stepper(),
                  SizedBox(height: 20.h),
                  _Title(title: title, subtitle: subtitle),
                  SizedBox(height: 30.h),
                  ...childern,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Stepper extends StatelessWidget {
  const _Stepper();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: EasyStepper(
        activeStep: SetupCubit.get(context).currentStep,
        fitWidth: true,
        stepRadius: 22.r,
        showTitle: false,
        enableStepTapping: true,
        showLoadingAnimation: false,
        steps: [
          EasyStep(
            icon: const Icon(IconBroken.Profile),
            activeIcon: const Icon(IconBroken.Profile),
          ),
          EasyStep(
            icon: const Icon(IconBroken.Wallet),
            activeIcon: const Icon(IconBroken.Wallet),
          ),
          EasyStep(
            icon: const Icon(IconBroken.Setting),
            activeIcon: const Icon(IconBroken.Setting),
          ),
          EasyStep(
            icon: const Icon(IconBroken.Discovery),
            activeIcon: const Icon(IconBroken.Discovery),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final String subtitle;
  const _Title({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        spacing: 5.h,
        children: [
          SizedBox(height: 20.h),
          CustomText(
            text: title,
            size: 24.sp,
            type: Type.overMedium,
            textAlign: TextAlign.center,
          ),
          CustomText(
            text: subtitle,
            maxLines: 3,
            size: 16.sp,
            type: Type.overMedium,
            textAlign: TextAlign.center,
            opacity: FontOpacity.medium,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
