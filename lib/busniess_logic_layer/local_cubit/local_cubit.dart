// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import, depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:workspace/helpers/language_cahe_helper.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());
  final LanguageCaheHelper languageCaheHelper = LanguageCaheHelper();
  Future<void> getCurrentLocal() async {
    final cahedLanguage = await languageCaheHelper.getCahedLanguageCode();
    emit(LocalChanged(locale: Locale(cahedLanguage)));
  }

  Future<void> changeLocal(String languageCode) async {
    await languageCaheHelper.caheLanguageCode(languageCode);
    emit(LocalChanged(locale: Locale(languageCode)));
  }
}
