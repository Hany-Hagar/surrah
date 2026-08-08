import 'setup_body.dart';
import '../../../../const/aseets.dart';
import 'package:flutter/material.dart';
import '../../manager/setup_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../../di/server_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../settings/model/app_user_pref_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../settings/presentation/manager/settings_cubit.dart';

class ThemeBody extends StatelessWidget {
  const ThemeBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return SetupBody(
      title: s.themeTitle,
      subtitle: s.themeSubtitle,
      childern: [
        _Theme(),
        const Spacer(),
        _Card(),
        SizedBox(height: 24.h),
        CustomButton(
          text: s.next,
          borderRadius: 4.r,
          onPressed: () => SetupCubit.get(context).nextStep(),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class _Theme extends StatelessWidget {
  const _Theme();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, AppUserPref>(
      builder: (context, state) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.26,
        child: Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: _ThemeItem(
                imagePath: Assets.lightTheme,
                themeMode: ThemeMode.light,
              ),
            ),
            Expanded(
              child: _ThemeItem(
                imagePath: Assets.darkTheme,
                themeMode: ThemeMode.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeItem extends StatelessWidget {
  final String imagePath;
  final ThemeMode themeMode;
  const _ThemeItem({required this.imagePath, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => getIt<SettingsCubit>().updateTheme(themeMode),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: getIt<SettingsCubit>().state.theme == themeMode
                ? Colors.blue
                : Colors.transparent,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        spacing: 10.w,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 255, 209, 59).withAlpha(50),
            ),
            child: Icon(
              Icons.lightbulb,
              size: 24.sp,
              color: const Color.fromARGB(255, 255, 239, 59),
            ),
          ),
          Expanded(
            child: CustomText(
              text: S.of(context).themeCard,
              maxLines: 3,
              size: 14.sp,
              type: Type.overMedium,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
