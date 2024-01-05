import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/const/dropdown_options.dart';
import 'package:temps/app/presentation/global/utils/map_languages.dart';
import 'package:temps/app/presentation/modules/settings/settings_controller.dart';
import 'package:temps/generated/translations.g.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<SettingsView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(settingControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          texts.settings.settings,
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            title: Text(
              texts.settings.temperature,
            ),
            trailing: DropdownButton(
              underline: const SizedBox(),
              value: controller.isFarenheit
                  ? DropdownOptions.temperature.last
                  : DropdownOptions.temperature.first,
              items: DropdownOptions.temperature
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                ref.read(settingControllerProvider.notifier).updateIsFahrenheit(
                    value == DropdownOptions.temperature.first ? false : true);
              },
            ),
          ),
          ListTile(
            title: Text(
              texts.settings.language,
            ),
            trailing: DropdownButton(
              value: controller.locale,
              underline: const SizedBox(),
              items: AppLocale.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        mapLanguages(e),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                ref
                    .read(settingControllerProvider.notifier)
                    .updateLocale(value ?? AppLocale.en);
              },
            ),
          ),
        ],
      ),
    );
  }
}
