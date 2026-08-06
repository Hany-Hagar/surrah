import 'package:flutter/widgets.dart';
import '../../../core/widgets/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetupTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const SetupTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        spacing: 5.h,
        children: [
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
            textAlign: TextAlign.center,
            opacity: FontOpacity.medium,
          ),
        ],
      ),
    );
  }
}
