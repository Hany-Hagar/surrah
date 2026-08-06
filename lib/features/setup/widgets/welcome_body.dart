import 'setup_title.dart';
import '../../../const/aseets.dart';
import '../../../generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/icon_broken.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 20.h,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 6),
        SizedBox(width: double.infinity),
        const _Logo(),
        Spacer(flex: 2),
        SetupTitle(title: s.setupTitle, subtitle: s.setupSubtitle),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: _SetupData(),
        ),
        Spacer(flex: 3),
        _Button(),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(40.r),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme.colorScheme.secondary.withValues(alpha: 0.02),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Image.asset(
        Assets.setup1,
        fit: BoxFit.fill,
        width: size.width * 0.39,
        height: size.width * 0.39,
      ),
    );
  }
}

class _SetupData extends StatelessWidget {
  const _SetupData();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      spacing: 12.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: double.infinity),
        _SetupTitle(icon: IconBroken.User, title: s.personalizeExperience),
        _SetupTitle(icon: IconBroken.Wallet, title: s.chooseCurrency),
        _SetupTitle(icon: IconBroken.Setting, title: s.pickTheme),
        _SetupTitle(icon: IconBroken.Discovery, title: s.selectLanguage),
        _SetupTitle(
          icon: IconBroken.Notification,
          title: s.enableNotifications,
        ),
        _SetupTitle(icon: IconBroken.Lock, title: s.protectData),
      ],
    );
  }
}

class _SetupTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SetupTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      spacing: 10.w,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Icon(icon, size: 26.sp, color: theme.scaffoldBackgroundColor),
        ),
        CustomText(text: title, size: 16, type: Type.overMedium),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.w),
      child: CustomButton(
        borderRadius: 4.r,
        text: S.of(context).getStarted,
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/home");
        },
      ),
    );
  }
}
