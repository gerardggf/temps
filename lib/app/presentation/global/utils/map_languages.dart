import '../../../../generated/translations.g.dart';

String mapLanguages(AppLocale locale) {
  switch (locale) {
    case AppLocale.ca:
      return 'Català';
    case AppLocale.es:
      return 'Español';
    default:
      return 'English';
  }
}
