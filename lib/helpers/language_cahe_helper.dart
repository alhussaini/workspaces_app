import 'package:shared_preferences/shared_preferences.dart';

class LanguageCaheHelper {
  Future<void> caheLanguageCode(String languageCode) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCAL", languageCode);
  }

  Future<String> getCahedLanguageCode() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final cahcedLanguageCode = sharedPreferences.getString("LOCAL");
    if (cahcedLanguageCode != null) {
      return cahcedLanguageCode;
    } else {
      return "ar";
    }
  }
}
