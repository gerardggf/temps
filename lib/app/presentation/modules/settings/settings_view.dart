import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/const/dropdown_options.dart';
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Temperatura'),
            onTap: () {},
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
            title: const Text('Idioma'),
            onTap: () {},
            trailing: DropdownButton(
              value: DropdownOptions.language[controller.locale.index],
              underline: const SizedBox(),
              items: DropdownOptions.language
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                final result = {
                  DropdownOptions.language[0]: AppLocale.ca,
                  DropdownOptions.language[1]: AppLocale.es,
                  DropdownOptions.language[2]: AppLocale.en,
                };
                ref
                    .read(settingControllerProvider.notifier)
                    .updateLocale(result[value] ?? AppLocale.en);
              },
            ),
          ),
        ],
      ),
    );
  }
}
