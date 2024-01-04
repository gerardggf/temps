import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:temps/app/domain/models/current_weather_model.dart';
import 'package:temps/app/domain/repositories/weather_repository.dart';
import 'package:temps/app/presentation/modules/home/home_controller.dart';
import 'package:temps/app/presentation/modules/home/widgets/errors/location_not_found_widget.dart';
import 'package:temps/app/presentation/modules/home/widgets/loading_widget.dart';
import 'package:temps/app/presentation/routes/routes.dart';
import '../../../domain/either/either.dart';
import '../../../domain/http_failure/error_type.dart';
import 'weather_widget.dart';
import 'widgets/errors/no_position_widget.dart';
import 'widgets/search_text_bar_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

final getWeatherFutureProvider =
    FutureProvider.family<Either<ErrorType, CurrentWeatherModel>, String?>(
  (ref, city) => city != null
      ? ref.watch(weatherRepositoryProvider).getCurrentWeatherData(city: city)
      : ref.watch(weatherRepositoryProvider).getCurrentWeatherData(),
);

class _HomeViewState extends ConsumerState<HomeView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeControllerProvider);
    final getWeatherFuture = controller.searchBarText != null
        ? ref.watch(getWeatherFutureProvider(controller.searchBarText))
        : ref.watch(getWeatherFutureProvider(null));

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            getWeatherFuture.when(
              data: (either) {
                return either.when(
                  left: (failure) {
                    return failure.maybeWhen(
                      noPosition: () => const NoPositionWidget(),
                      locationNotFound: () => const LocationNotFoundWidget(),
                      orElse: () => Container(
                        color: Colors.grey,
                        child: const Center(
                          child: Text(
                            'Se ha producido un error',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  right: (data) {
                    if (kDebugMode) {
                      print(data.weather.first.id);
                      print(data.weather.first.description);
                    }
                    return WeatherWidget(weather: data);
                  },
                );
              },
              error: (e, __) {
                return Center(
                  child: Text('Error: ${e.toString()}'),
                );
              },
              loading: () => const LoadingWidget(),
            ),
            SearchTextBarWidget(searchController: _searchController),
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () {
                    context.pushNamed(Routes.settings);
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
