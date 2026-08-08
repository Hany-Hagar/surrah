import 'package:flutter/material.dart';
import '../widgets/currency_body.dart';
import '../../manager/setup_cubit.dart';
import '../../manager/setup_states.dart';
import '../widgets/personal_info_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SetupCubit()..initialize(),
      child: BlocBuilder<SetupCubit, SetupStates>(
        builder: (context, state) => Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: SetupCubit.get(context).pageController,
            children: [
              PersonalInfoBody(),
              CurrencyBody(),
            ],
          ),
        ),
      ),
    );
  }
}
