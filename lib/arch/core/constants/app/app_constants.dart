const appConstants = """
import 'package:provider/provider.dart';
import '../../../common/viewModels/language_view_model.dart';
import '../../../common/viewModels/theme_view_model.dart';

// Uygulamayla ilgili temel veriler
class AppConstants {
  static const appName = 'AppName';
  static const fontFamily = 'fontFamily';
  static const privacyLink = '{PRIVACY_LINK}';
  static const supportMail = '{SUPPORT_MAIL}';

  static final defaultProviders = [
    ChangeNotifierProvider<ThemeViewModel>(
      create: (context) => ThemeViewModel(),
    ),
    ChangeNotifierProvider<LanguageViewModel>(
      create: (context) => LanguageViewModel(),
    ),
  ];
}
""";
