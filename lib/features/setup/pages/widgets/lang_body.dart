import '../../../../const/aseets.dart';
import '../../../../core/services/dialog_service.dart';
import 'setup_body.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../di/server_locator.dart';
import 'package:country_flags/country_flags.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../settings/model/language_model.dart';
import '../../../../core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/extensions/language_extension.dart';
import '../../../settings/presentation/manager/settings_cubit.dart';

class LangBody extends StatelessWidget {
  const LangBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return SetupBody(
      title: s.languageTitle,
      subtitle: s.languageSubtitle,
      childern: [
        const _Language(),
        const Spacer(),
        CustomButton(
          text: s.completeSetup,
          borderRadius: 4.r,
          onPressed: () {
            getIt<SettingsCubit>().updateIsFirstTime(false);
            DialogServices.showCustomDialog(
              context: context,
              body: const _CompleteDialog(),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            );
          },
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class _Language extends StatelessWidget {
  const _Language();
  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    var currentLanguage = getIt<SettingsCubit>().state.lang;
    var otherLanguages = languagesData(
      context,
    ).getOtherModels(current: currentLanguage);
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: s.currentLanguage, size: 18.sp, type: Type.header),
        _Item(language: currentLanguage),
        SizedBox(height: 5.h),
        CustomText(text: s.otherLanguages, size: 18.sp, type: Type.header),
        _Languages(languages: otherLanguages),
      ],
    );
  }
}

class _Languages extends StatelessWidget {
  final List<LanguageModel> languages;
  const _Languages({required this.languages});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        languages.length,
        (index) => _Item(language: languages[index]),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final LanguageModel language;
  const _Item({required this.language});
  @override
  Widget build(BuildContext context) {
    var isSelected = getIt<SettingsCubit>().state.lang.id == language.id;
    return ListTile(
      onTap: () =>
          getIt<SettingsCubit>().updateLanguage(language.languageCode, context),
      minTileHeight: 55.h,
      minVerticalPadding: 5.h,
      shape: _getShapeBorder(context),
      trailing: isSelected
          ? Icon(Icons.check_box_rounded, size: 24.sp)
          : Icon(Icons.check_box_outline_blank, size: 24.sp),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      title: CustomText(
        text: language.language,
        size: 16.sp,
        type: Type.header,
      ),
      subtitle: CustomText(
        text: language.country,
        size: 14.sp,
        type: Type.overMedium,
      ),
      leading: CountryFlag.fromCountryCode(
        language.countryCode,
        theme: EmojiTheme(),
      ),
    );
  }

  ShapeBorder _getShapeBorder(BuildContext context) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.r),
      side: BorderSide(color: Theme.of(context).colorScheme.secondary),
    );
  }
}

class _CompleteDialog extends StatelessWidget {
  const _CompleteDialog();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.completeSetup,
          width: width * 0.33,
          height: width * 0.35,
        ),
        SizedBox(height: 20.h),
        CustomText(
          text: "تم حفظ الإعدادات بنجاح",
          maxLines: 2,
          size: 16.sp,
          type: Type.header,
        ),
        SizedBox(height: 10.h),
        CustomText(
          text: "تم حفظ الإعدادات بنجاح، يمكنك الآن استخدام التطبيق.",
          maxLines: 2,
          size: 14.sp,
          type: Type.overMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
