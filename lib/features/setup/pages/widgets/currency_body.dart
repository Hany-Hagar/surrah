import 'setup_body.dart';
import 'package:flutter/material.dart';
import '../../manager/setup_cubit.dart';
import '../../manager/setup_states.dart';
import '../../../../generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:country_flags/country_flags.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_button.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyBody extends StatelessWidget {
  const CurrencyBody({super.key});

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return SetupBody(
      title: s.currencyTitle,
      subtitle: s.currencySubtitle,
      childern: [
        const _CurrentCurrency(),
        Spacer(),
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

class _CurrentCurrency extends StatelessWidget {
  const _CurrentCurrency();

  @override
  Widget build(BuildContext context) {
    var s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        CustomText(text: s.currentCurrency, size: 18.sp, type: Type.header),
        BlocBuilder<SetupCubit, SetupStates>(
          builder: (context, state) =>
              _CurrencyItem(currency: SetupCubit.get(context).selectedCurrency),
        ),
      ],
    );
  }
}

class _CurrencyItem extends StatelessWidget {
  final Currency currency;
  const _CurrencyItem({required this.currency});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showCurrencyPicker(
          context: context,
          showFlag: true,
          showCurrencyName: true,
          showCurrencyCode: true,
          favorite: ['EGP', 'SAR', 'USD', 'EUR'],
          currencyFilter: CurrencyService()
              .getAll()
              .where((currency) => currency.code.toUpperCase() != 'ILS')
              .map((currency) => currency.code)
              .toList(),
          onSelect: (value) => SetupCubit.get(context).selectCurrency(value),
        );
      },
      minTileHeight: 50.h,
      shape: _getShapeBorder(context),
      trailing: Icon(Icons.keyboard_arrow_down, size: 24.sp),
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
      leading: CountryFlag.fromCurrencyCode(currency.code, theme: EmojiTheme()),
      subtitle: CustomText(
        text: currency.name,
        size: 16.sp,
        type: Type.overMedium,
      ),
      title: CustomText(
        text: "${currency.code} ( ${currency.symbol} )",
        size: 16.sp,
        type: Type.header,
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
