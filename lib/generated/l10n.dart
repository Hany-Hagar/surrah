// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Surrah`
  String get appTitle {
    return Intl.message('Surrah', name: 'appTitle', desc: '', args: []);
  }

  /// `Track Every Expense`
  String get onboardingTitle1 {
    return Intl.message(
      'Track Every Expense',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Monitor your income and expenses with ease.`
  String get onboardingDescription1 {
    return Intl.message(
      'Monitor your income and expenses with ease.',
      name: 'onboardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Build Better Financial Habits`
  String get onboardingTitle2 {
    return Intl.message(
      'Build Better Financial Habits',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Develop smart financial habits for a more secure future.`
  String get onboardingDescription2 {
    return Intl.message(
      'Develop smart financial habits for a more secure future.',
      name: 'onboardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Reach Your Financial Goals`
  String get onboardingTitle3 {
    return Intl.message(
      'Reach Your Financial Goals',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Save consistently and achieve your financial goals.`
  String get onboardingDescription3 {
    return Intl.message(
      'Save consistently and achieve your financial goals.',
      name: 'onboardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Stay in Control`
  String get onboardingTitle4 {
    return Intl.message(
      'Stay in Control',
      name: 'onboardingTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Manage your finances with confidence and make informed decisions.`
  String get onboardingDescription4 {
    return Intl.message(
      'Manage your finances with confidence and make informed decisions.',
      name: 'onboardingDescription4',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Welcome!`
  String get setupTitle {
    return Intl.message('Welcome!', name: 'setupTitle', desc: '', args: []);
  }

  /// `Let's set up your profile and preferences`
  String get setupSubtitle {
    return Intl.message(
      'Let\'s set up your profile and preferences',
      name: 'setupSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Personalize your experience`
  String get personalizeExperience {
    return Intl.message(
      'Personalize your experience',
      name: 'personalizeExperience',
      desc: '',
      args: [],
    );
  }

  /// `Choose your currency`
  String get chooseCurrency {
    return Intl.message(
      'Choose your currency',
      name: 'chooseCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Pick your theme`
  String get pickTheme {
    return Intl.message(
      'Pick your theme',
      name: 'pickTheme',
      desc: '',
      args: [],
    );
  }

  /// `Select your language`
  String get selectLanguage {
    return Intl.message(
      'Select your language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Enable smart notifications`
  String get enableNotifications {
    return Intl.message(
      'Enable smart notifications',
      name: 'enableNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Protect your data`
  String get protectData {
    return Intl.message(
      'Protect your data',
      name: 'protectData',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personalInfoTitle {
    return Intl.message(
      'Personal Information',
      name: 'personalInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please provide your personal information to continue.`
  String get personalInfoSubtitle {
    return Intl.message(
      'Please provide your personal information to continue.',
      name: 'personalInfoSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Ex: John`
  String get firstNameHint {
    return Intl.message('Ex: John', name: 'firstNameHint', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Ex: Doe`
  String get lastNameHint {
    return Intl.message('Ex: Doe', name: 'lastNameHint', desc: '', args: []);
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Ex: john.doe@example.com`
  String get emailAddressHint {
    return Intl.message(
      'Ex: john.doe@example.com',
      name: 'emailAddressHint',
      desc: '',
      args: [],
    );
  }

  /// `( Optional )`
  String get optional {
    return Intl.message('( Optional )', name: 'optional', desc: '', args: []);
  }

  /// `Choose Your Currency`
  String get currencyTitle {
    return Intl.message(
      'Choose Your Currency',
      name: 'currencyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select your preferred currency to use in the app.`
  String get currencySubtitle {
    return Intl.message(
      'Select your preferred currency to use in the app.',
      name: 'currencySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Current Currency`
  String get currentCurrency {
    return Intl.message(
      'Current Currency',
      name: 'currentCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Theme`
  String get themeTitle {
    return Intl.message(
      'Choose Your Theme',
      name: 'themeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select your preferred theme for the app.`
  String get themeSubtitle {
    return Intl.message(
      'Select your preferred theme for the app.',
      name: 'themeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `The theme you select will be applied to the app interface and will affect the overall look and feel of the app.`
  String get themeCard {
    return Intl.message(
      'The theme you select will be applied to the app interface and will affect the overall look and feel of the app.',
      name: 'themeCard',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
