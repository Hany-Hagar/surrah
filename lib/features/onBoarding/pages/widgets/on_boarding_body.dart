import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/utils/nav_to.dart';
import '../../models/on_boarding_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../setup/views/welcome_view.dart';
import '../../../../core/utils/icon_broken.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBody extends StatelessWidget {
  final PageController pageController;
  final OnBoardingModel onBoardingModel;
  final Widget pageIndicator;

  const OnBoardingBody({
    super.key,
    required this.onBoardingModel,
    required this.pageIndicator,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            _Skip(pageController: pageController),
            const Spacer(flex: 2),
            SvgPicture.asset(
              onBoardingModel.imagePath,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const Spacer(flex: 3),
            _Text(onBoardingModel: onBoardingModel),
            const Spacer(flex: 1),
            pageIndicator,
            SizedBox(height: 28.h),
            _Button(
              pageController: pageController,
              onBoardingModel: onBoardingModel,
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}

class _Skip extends StatelessWidget {
  final PageController pageController;
  const _Skip({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: GestureDetector(
        onTap: () => pageController.jumpToPage(
          onBoardingsData(context: context).length - 1,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 16.h, end: 8.w),
          child: CustomText(
            text: S.of(context).skip,
            size: 16.sp,
            type: Type.medium,
          ),
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  final OnBoardingModel onBoardingModel;
  const _Text({required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: [
        CustomText(
          text: onBoardingModel.title,
          size: 24.sp,
          type: Type.header,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        CustomText(
          text: onBoardingModel.subTitle,
          size: 16.sp,
          maxLines: 3,
          type: Type.medium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  final PageController pageController;
  final OnBoardingModel onBoardingModel;

  const _Button({required this.pageController, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return CustomButton(
      onPressed: () {
        if (onBoardingModel.id == onBoardingsData(context: context).length) {
          NavTo.pushReplacement(
            context: context,
            nextPage: const WelcomeView(),
          );
        } else {
          pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      borderRadius: 8.r,
      text: onBoardingModel.id == onBoardingsData(context: context).length
          ? s.getStarted
          : s.next,
      icon: isRtl ? IconBroken.Arrow___Left_2 : IconBroken.Arrow___Right_2,
    );
  }
}
