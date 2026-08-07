import 'setup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupCubit extends Cubit<SetupStates> {
  SetupCubit() : super(SetupInitialState());
  static SetupCubit get(BuildContext context) => BlocProvider.of(context);

  int currentStep = 0;
  PageController pageController = PageController(initialPage: 0);
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // Form key not required
  void nextStep([GlobalKey<FormState>? formKey]) {
    if (formKey != null && !(formKey.currentState?.validate() ?? false)) {
      return;
    }
    currentStep++;
    pageController.animateToPage(
      currentStep,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(ChangeSetupState());
  }
}
