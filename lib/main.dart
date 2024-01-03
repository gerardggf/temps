import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/presentation/routes/router.dart';
import 'generated/translations.g.dart';

void main() {
  runApp(
    TranslationProvider(
      child: const ProviderScope(
        overrides: [],
        child: TempsApp(),
      ),
    ),
  );
}

class TempsApp extends StatefulWidget {
  const TempsApp({super.key});

  @override
  State<TempsApp> createState() => _TempsAppState();
}

class _TempsAppState extends State<TempsApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'eBntz',
      ),
    );
  }
}
