import 'dart:developer';

import 'package:currency_picker/currency_picker.dart';

import 'setup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupCubit extends Cubit<SetupStates> {
  SetupCubit() : super(SetupInitialState());
  static SetupCubit get(BuildContext context) => BlocProvider.of(context);

  // General
  int currentStep = 0;
  PageController pageController = PageController(initialPage: 0);

  void initialize() {
    setupCurrency();
  }

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

  // Personal Info Controllers
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // Currency
  List<Currency> currencies = CurrencyService().getAll();
  late Currency selectedCurrency;

  void setupCurrency() {
    currencies =  currencies.where((currency) => currency.code != "ILS").toList();
    selectedCurrency = CurrencyService().getAll().firstWhere(
      (currency) => currency.code == "EGP",
      orElse: () => CurrencyService().getAll().first,
    );
  }

  void selectCurrency(Currency currency) {
    selectedCurrency = currency;
    log("Selected Currency: ${currency.name} (${currency.code})");
    emit(ChangeSetupState());
  }
}
