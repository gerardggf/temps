import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:temps/app/domain/models/current_weather_model.dart';
import 'package:temps/app/domain/repositories/weather_repository.dart';

import '../../../data/cities/cities.dart';
import '../../../domain/either/either.dart';
import '../../../domain/http_failure/http_failure.dart';
import 'weather_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

final getWeatherFutureProvider =
    FutureProvider<Either<HttpFailure, CurrentWeatherModel>>(
  (ref) => ref.watch(weatherRepositoryProvider).getCurrentWeatherData(),
);

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final getWeatherFuture = ref.watch(getWeatherFutureProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: getWeatherFuture.when(
                data: (either) {
                  return either.when(
                    left: (failure) {
                      return Center(
                        child: Text(
                          failure.maybeWhen(
                              noPosition: () =>
                                  'No se ha podido encontrar tu ubicación',
                              orElse: () => 'Se ha producido un error'),
                        ),
                      );
                    },
                    right: (data) {
                      return WeatherWidget(weather: data);
                    },
                  );
                },
                error: (e, __) {
                  return Center(
                    child: Text('Error: ${e.toString()}'),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.black,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: citiesSpain.length,
                  itemBuilder: (context, index) {
                    if (citiesSpain[index]["city"] == null) {
                      return const SizedBox();
                    }
                    return AspectRatio(
                      aspectRatio: 2,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              citiesSpain[index]["city"]!,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
