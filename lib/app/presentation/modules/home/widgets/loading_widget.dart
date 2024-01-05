import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/presentation/global/extensions/num_sizedbox_extension.dart';
import 'package:temps/generated/translations.g.dart';

import '../../../../const/colors.dart';

class LoadingWidget extends ConsumerWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.clearSky, AppColors.sky]),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(texts.global.currentLocation),
                    const Text(
                      '-',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 120,
                      child: Text(
                        '-',
                        style: TextStyle(fontSize: 50),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            '-',
                            style: TextStyle(fontSize: 60),
                          ),
                          20.h,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${texts.global.tempMin}  -',
                              ),
                              Text(
                                '${texts.global.tempMax}  -',
                              ),
                            ],
                          ),
                          30.h,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.global.feelsLike,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  3.h,
                                  const Text(
                                    '-',
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.global.humidity,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  3.h,
                                  const Text(
                                    '-',
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
