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

  /// `By creating a Company, you accept our `
  String get creatingCompany {
    return Intl.message(
      'By creating a Company, you accept our ',
      name: 'creatingCompany',
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

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get preferences {
    return Intl.message(
      'Preferences',
      name: 'preferences',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Resources`
  String get resources {
    return Intl.message(
      'Resources',
      name: 'resources',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contactSupport {
    return Intl.message(
      'Contact Support',
      name: 'contactSupport',
      desc: '',
      args: [],
    );
  }

  /// `Rate Us in Play Store`
  String get RateUs {
    return Intl.message(
      'Rate Us in Play Store',
      name: 'RateUs',
      desc: '',
      args: [],
    );
  }

  /// `Recovery Email`
  String get recoveryEmail {
    return Intl.message(
      'Recovery Email',
      name: 'recoveryEmail',
      desc: '',
      args: [],
    );
  }

  /// `Update Account`
  String get updateAccount {
    return Intl.message(
      'Update Account',
      name: 'updateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get currentPassword {
    return Intl.message(
      'Current Password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Add Company`
  String get addCompany {
    return Intl.message(
      'Add Company',
      name: 'addCompany',
      desc: '',
      args: [],
    );
  }

  /// `Delete Company`
  String get deleteCompany {
    return Intl.message(
      'Delete Company',
      name: 'deleteCompany',
      desc: '',
      args: [],
    );
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `Company Email`
  String get companyEmail {
    return Intl.message(
      'Company Email',
      name: 'companyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Company Description`
  String get companyDescription {
    return Intl.message(
      'Company Description',
      name: 'companyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Industry`
  String get industry {
    return Intl.message(
      'Industry',
      name: 'industry',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get adress {
    return Intl.message(
      'Address',
      name: 'adress',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employees {
    return Intl.message(
      'Employees',
      name: 'employees',
      desc: '',
      args: [],
    );
  }

  /// `View Jobs`
  String get viewJobs {
    return Intl.message(
      'View Jobs',
      name: 'viewJobs',
      desc: '',
      args: [],
    );
  }

  /// `Min Employees`
  String get minimumEmployees {
    return Intl.message(
      'Min Employees',
      name: 'minimumEmployees',
      desc: '',
      args: [],
    );
  }

  /// `Max Employees`
  String get maximumEmployees {
    return Intl.message(
      'Max Employees',
      name: 'maximumEmployees',
      desc: '',
      args: [],
    );
  }

  /// `Edit Company`
  String get editCompany {
    return Intl.message(
      'Edit Company',
      name: 'editCompany',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to`
  String get areYouSure {
    return Intl.message(
      'Are you sure you want to',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Add Job`
  String get addJob {
    return Intl.message(
      'Add Job',
      name: 'addJob',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get jobTitle {
    return Intl.message(
      'Job Title',
      name: 'jobTitle',
      desc: '',
      args: [],
    );
  }

  /// `Job Location`
  String get jobLocation {
    return Intl.message(
      'Job Location',
      name: 'jobLocation',
      desc: '',
      args: [],
    );
  }

  /// `Working Time`
  String get workingTime {
    return Intl.message(
      'Working Time',
      name: 'workingTime',
      desc: '',
      args: [],
    );
  }

  /// `Seniority Level`
  String get seniorityLevel {
    return Intl.message(
      'Seniority Level',
      name: 'seniorityLevel',
      desc: '',
      args: [],
    );
  }

  /// `Job Description`
  String get jobDescription {
    return Intl.message(
      'Job Description',
      name: 'jobDescription',
      desc: '',
      args: [],
    );
  }

  /// `Technical Skills`
  String get technicalSkills {
    return Intl.message(
      'Technical Skills',
      name: 'technicalSkills',
      desc: '',
      args: [],
    );
  }

  /// `Soft Skills`
  String get softSkills {
    return Intl.message(
      'Soft Skills',
      name: 'softSkills',
      desc: '',
      args: [],
    );
  }

  /// `By creating a Job, you accept our `
  String get creatingJob {
    return Intl.message(
      'By creating a Job, you accept our ',
      name: 'creatingJob',
      desc: '',
      args: [],
    );
  }

  /// `Junior`
  String get junior {
    return Intl.message(
      'Junior',
      name: 'junior',
      desc: '',
      args: [],
    );
  }

  /// `Mid-Level`
  String get midLevel {
    return Intl.message(
      'Mid-Level',
      name: 'midLevel',
      desc: '',
      args: [],
    );
  }

  /// `Senior`
  String get senior {
    return Intl.message(
      'Senior',
      name: 'senior',
      desc: '',
      args: [],
    );
  }

  /// `Team-Lead`
  String get teamLead {
    return Intl.message(
      'Team-Lead',
      name: 'teamLead',
      desc: '',
      args: [],
    );
  }

  /// `CTO`
  String get cto {
    return Intl.message(
      'CTO',
      name: 'cto',
      desc: '',
      args: [],
    );
  }

  /// `Onsite`
  String get onsite {
    return Intl.message(
      'Onsite',
      name: 'onsite',
      desc: '',
      args: [],
    );
  }

  /// `Remotely`
  String get remotely {
    return Intl.message(
      'Remotely',
      name: 'remotely',
      desc: '',
      args: [],
    );
  }

  /// `Hybrid`
  String get hybrid {
    return Intl.message(
      'Hybrid',
      name: 'hybrid',
      desc: '',
      args: [],
    );
  }

  /// `Full-Time`
  String get fullTime {
    return Intl.message(
      'Full-Time',
      name: 'fullTime',
      desc: '',
      args: [],
    );
  }

  /// `Part-Time`
  String get partTime {
    return Intl.message(
      'Part-Time',
      name: 'partTime',
      desc: '',
      args: [],
    );
  }

  /// `Create Job`
  String get createJob {
    return Intl.message(
      'Create Job',
      name: 'createJob',
      desc: '',
      args: [],
    );
  }

  /// `Apply Now`
  String get applyNow {
    return Intl.message(
      'Apply Now',
      name: 'applyNow',
      desc: '',
      args: [],
    );
  }

  /// `Delete Job`
  String get deleteJob {
    return Intl.message(
      'Delete Job',
      name: 'deleteJob',
      desc: '',
      args: [],
    );
  }

  /// `Update Job`
  String get updateJob {
    return Intl.message(
      'Update Job',
      name: 'updateJob',
      desc: '',
      args: [],
    );
  }

  /// `Enter New`
  String get enterNew {
    return Intl.message(
      'Enter New',
      name: 'enterNew',
      desc: '',
      args: [],
    );
  }

  /// `Application`
  String get application {
    return Intl.message(
      'Application',
      name: 'application',
      desc: '',
      args: [],
    );
  }

  /// `Upload Resume`
  String get uploadResume {
    return Intl.message(
      'Upload Resume',
      name: 'uploadResume',
      desc: '',
      args: [],
    );
  }

  /// `Uploaded !`
  String get uploaded {
    return Intl.message(
      'Uploaded !',
      name: 'uploaded',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `File not picked !`
  String get fileNotPicked {
    return Intl.message(
      'File not picked !',
      name: 'fileNotPicked',
      desc: '',
      args: [],
    );
  }

  /// `Application Sent Successfully!`
  String get applicationSent {
    return Intl.message(
      'Application Sent Successfully!',
      name: 'applicationSent',
      desc: '',
      args: [],
    );
  }

  /// `View Applications`
  String get viewApplications {
    return Intl.message(
      'View Applications',
      name: 'viewApplications',
      desc: '',
      args: [],
    );
  }

  /// `Applications`
  String get applications {
    return Intl.message(
      'Applications',
      name: 'applications',
      desc: '',
      args: [],
    );
  }

  /// `resume`
  String get resume {
    return Intl.message(
      'resume',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `Generate Excel Sheet`
  String get generateExcell {
    return Intl.message(
      'Generate Excel Sheet',
      name: 'generateExcell',
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
