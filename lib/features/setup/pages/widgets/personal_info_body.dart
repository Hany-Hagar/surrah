import 'setup_body.dart';
import 'package:flutter/material.dart';
import '../../manager/setup_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/profile_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class PersonalInfoBody extends StatelessWidget {
  const PersonalInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final formKey = GlobalKey<FormState>();
    return SetupBody(
      title: s.personalInfoTitle,
      subtitle: s.personalInfoSubtitle,
      childern: [
        ProfileAvatar(radius: 70),
        SizedBox(height: 25.h),
        _Items(formKey: formKey),
        const Spacer(),
        CustomButton(
          onPressed: () => SetupCubit.get(context).nextStep(formKey),
          borderRadius: 4.r,
          text: S.of(context).next,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class _Items extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const _Items({required this.formKey});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);

    return Column(
      spacing: 10.h,
      children: [
        SizedBox(height: 15.h),
        Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              _Item(
                title: s.firstName,
                icon: Icons.person,
                hintText: s.firstNameHint,
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
              ),
              _Item(
                title: s.lastName,
                icon: Icons.person,
                hintText: s.lastNameHint,
                controller: TextEditingController(),
                keyboardType: TextInputType.name,
              ),
            ],
          ),
        ),
        _Item(
          title: s.emailAddress,
          subtitle: s.optional,
          icon: Icons.email,
          hintText: s.emailAddressHint,
          controller: TextEditingController(),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  final String title;
  final IconData icon;
  final String hintText;
  final String? subtitle;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const _Item({
    required this.title,
    required this.icon,
    this.subtitle,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(text: title, size: 18.sp, type: Type.overMedium),
            if (subtitle != null)
              CustomText(
                text: subtitle!,
                size: 16.sp,
                type: Type.overMedium,
                opacity: FontOpacity.medium,
              ),
          ],
        ),
        CustomTextFormField(
          prefixIcon: icon,
          hintText: hintText,
          controller: controller,
          keyboardType: keyboardType,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.h),
        ),
      ],
    );
  }
}
