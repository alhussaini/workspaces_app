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
    final name =
        (locale.countryCode?.isEmpty ?? false)
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

  /// `hello login`
  String get welcomeStatementInLogin {
    return Intl.message(
      'hello login',
      name: 'welcomeStatementInLogin',
      desc: '',
      args: [],
    );
  }

  /// `please login`
  String get theGuidingStatmentInLogin {
    return Intl.message(
      'please login',
      name: 'theGuidingStatmentInLogin',
      desc: '',
      args: [],
    );
  }

  /// `hello Sigup`
  String get welcomeStatementInSignUp {
    return Intl.message(
      'hello Sigup',
      name: 'welcomeStatementInSignUp',
      desc: '',
      args: [],
    );
  }

  /// `please SignUP`
  String get theGuidingStatmentInSignUp {
    return Intl.message(
      'please SignUP',
      name: 'theGuidingStatmentInSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Confirm Password`
  String get reconfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'reconfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `تسجيل مستخدم جديد`
  String get bouttonSubmitSiginUp {
    return Intl.message(
      'تسجيل مستخدم جديد',
      name: 'bouttonSubmitSiginUp',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get bouttonSubmitLogin {
    return Intl.message(
      'login',
      name: 'bouttonSubmitLogin',
      desc: '',
      args: [],
    );
  }

  /// `Do not have acc`
  String get convertLabelInLogin {
    return Intl.message(
      'Do not have acc',
      name: 'convertLabelInLogin',
      desc: '',
      args: [],
    );
  }

  /// `sinup now`
  String get bouttonConvertInLogin {
    return Intl.message(
      'sinup now',
      name: 'bouttonConvertInLogin',
      desc: '',
      args: [],
    );
  }

  /// `Are you have acc`
  String get convertLabelInSigUp {
    return Intl.message(
      'Are you have acc',
      name: 'convertLabelInSigUp',
      desc: '',
      args: [],
    );
  }

  /// `login now`
  String get bouttonConvertInSigUp {
    return Intl.message(
      'login now',
      name: 'bouttonConvertInSigUp',
      desc: '',
      args: [],
    );
  }

  /// `OR sigin with`
  String get textDividerInRegestration {
    return Intl.message(
      'OR sigin with',
      name: 'textDividerInRegestration',
      desc: '',
      args: [],
    );
  }

  /// `Work Space Descreotion`
  String get workSpaceDescreotion {
    return Intl.message(
      'Work Space Descreotion',
      name: 'workSpaceDescreotion',
      desc: '',
      args: [],
    );
  }

  /// `Images`
  String get workSpaceImages {
    return Intl.message('Images', name: 'workSpaceImages', desc: '', args: []);
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Features`
  String get workSpaceFeature {
    return Intl.message(
      'Features',
      name: 'workSpaceFeature',
      desc: '',
      args: [],
    );
  }

  /// `rate`
  String get rating {
    return Intl.message('rate', name: 'rating', desc: '', args: []);
  }

  /// `stars`
  String get stars {
    return Intl.message('stars', name: 'stars', desc: '', args: []);
  }

  /// `Book Now`
  String get bookNow {
    return Intl.message('Book Now', name: 'bookNow', desc: '', args: []);
  }

  /// `Time And History`
  String get timeAndHistory {
    return Intl.message(
      'Time And History',
      name: 'timeAndHistory',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get tomorrow {
    return Intl.message('Tomorrow', name: 'tomorrow', desc: '', args: []);
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `This Week`
  String get thisWeek {
    return Intl.message('This Week', name: 'thisWeek', desc: '', args: []);
  }

  /// `select from calender`
  String get selectFromCalender {
    return Intl.message(
      'select from calender',
      name: 'selectFromCalender',
      desc: '',
      args: [],
    );
  }

  /// `Person Nums`
  String get personsNum {
    return Intl.message('Person Nums', name: 'personsNum', desc: '', args: []);
  }

  /// `Room Type`
  String get roomType {
    return Intl.message('Room Type', name: 'roomType', desc: '', args: []);
  }

  /// `Verifying Your Account`
  String get verifyYourAccount {
    return Intl.message(
      'Verifying Your Account',
      name: 'verifyYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Code had been sent to `
  String get textUnderVerifyAccount {
    return Intl.message(
      'Code had been sent to ',
      name: 'textUnderVerifyAccount',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Code To Verifying`
  String get enterCodeToVerify {
    return Intl.message(
      'Enter The Code To Verifying',
      name: 'enterCodeToVerify',
      desc: '',
      args: [],
    );
  }

  /// `compelete info to continue`
  String get compeleteInfoHeader {
    return Intl.message(
      'compelete info to continue',
      name: 'compeleteInfoHeader',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `wait`
  String get waitingBook {
    return Intl.message('wait', name: 'waitingBook', desc: '', args: []);
  }

  /// ` lettle wait`
  String get lettleWait {
    return Intl.message(' lettle wait', name: 'lettleWait', desc: '', args: []);
  }

  /// `wallet`
  String get wallet {
    return Intl.message('wallet', name: 'wallet', desc: '', args: []);
  }

  /// `cash`
  String get cash {
    return Intl.message('cash', name: 'cash', desc: '', args: []);
  }

  /// `debit/credit`
  String get card {
    return Intl.message('debit/credit', name: 'card', desc: '', args: []);
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
