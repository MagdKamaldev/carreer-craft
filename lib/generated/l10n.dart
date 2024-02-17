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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Career Craft`
  String get appName {
    return Intl.message(
      'Career Craft',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Your Career Compass !`
  String get slogan {
    return Intl.message(
      'Your Career Compass !',
      name: 'slogan',
      desc: '',
      args: [],
    );
  }

  /// `Feeling overwhelmed by the job market?`
  String get onBoardingText1 {
    return Intl.message(
      'Feeling overwhelmed by the job market?',
      name: 'onBoardingText1',
      desc: '',
      args: [],
    );
  }

  /// `Your career's next step isn't that far.`
  String get onBoardingText2 {
    return Intl.message(
      'Your career\'s next step isn\'t that far.',
      name: 'onBoardingText2',
      desc: '',
      args: [],
    );
  }

  /// `Join a big community of employees and employers.`
  String get onBoardingText3 {
    return Intl.message(
      'Join a big community of employees and employers.',
      name: 'onBoardingText3',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get onBoardingButton {
    return Intl.message(
      'Start Now',
      name: 'onBoardingButton',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back !`
  String get welcomeText {
    return Intl.message(
      'Welcome Back !',
      name: 'welcomeText',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get enterLogin {
    return Intl.message(
      'Login',
      name: 'enterLogin',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPasswordq {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPasswordq',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAccount {
    return Intl.message(
      'Create an account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `planning To hire ?`
  String get hirePlan {
    return Intl.message(
      'planning To hire ?',
      name: 'hirePlan',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Maybe`
  String get maybe {
    return Intl.message(
      'Maybe',
      name: 'maybe',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you accept our `
  String get creatingAcc {
    return Intl.message(
      'By creating an account, you accept our ',
      name: 'creatingAcc',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `field must not be empty`
  String get emptyValidation {
    return Intl.message(
      'field must not be empty',
      name: 'emptyValidation',
      desc: '',
      args: [],
    );
  }

  /// `Password and Confirm Password must be same`
  String get confirmpasValidation {
    return Intl.message(
      'Password and Confirm Password must be same',
      name: 'confirmpasValidation',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCode {
    return Intl.message(
      'Send Code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPasswordText {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordText',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address !`
  String get forgotPasswordText2 {
    return Intl.message(
      'Please enter your email address !',
      name: 'forgotPasswordText2',
      desc: '',
      args: [],
    );
  }

  /// `We will send you a code, it help us keep your account secure.`
  String get weWillSend {
    return Intl.message(
      'We will send you a code, it help us keep your account secure.',
      name: 'weWillSend',
      desc: '',
      args: [],
    );
  }

  /// `Check Your Mail`
  String get checkMail {
    return Intl.message(
      'Check Your Mail',
      name: 'checkMail',
      desc: '',
      args: [],
    );
  }

  /// `Validation Error`
  String get validationFailed {
    return Intl.message(
      'Validation Error',
      name: 'validationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Reset Code`
  String get resetCode {
    return Intl.message(
      'Reset Code',
      name: 'resetCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code sent to your email !`
  String get enterCode {
    return Intl.message(
      'Please enter the code sent to your email !',
      name: 'enterCode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Code`
  String get confirmCode {
    return Intl.message(
      'Confirm Code',
      name: 'confirmCode',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPass {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password !`
  String get confirmNewPassText {
    return Intl.message(
      'Enter your new password !',
      name: 'confirmNewPassText',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Successfully !`
  String get passwordChanged {
    return Intl.message(
      'Password Changed Successfully !',
      name: 'passwordChanged',
      desc: '',
      args: [],
    );
  }

  /// `Jobs`
  String get jobs {
    return Intl.message(
      'Jobs',
      name: 'jobs',
      desc: '',
      args: [],
    );
  }

  /// `Companies`
  String get companies {
    return Intl.message(
      'Companies',
      name: 'companies',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get news {
    return Intl.message(
      'News',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get Bio {
    return Intl.message(
      'Bio',
      name: 'Bio',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
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
