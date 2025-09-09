import 'package:appli_r/data/datasources/local/preferences/shared_preferences.dart';
import 'package:appli_r/data/datasources/local/publicTransport/public_transport_database.dart';
import 'package:appli_r/data/datasources/network/public_transport_api.dart';
import 'package:appli_r/data/repositories/bikes_repository.dart';
import 'package:appli_r/data/repositories/location_repository.dart';
import 'package:appli_r/data/repositories/preferences_repository.dart';
import 'package:appli_r/data/repositories/public_transport_repository.dart';
import 'package:appli_r/data/datasources/network/voi_api.dart';
import 'package:appli_r/domain/repositories/bikes_repository.dart';
import 'package:appli_r/domain/repositories/location_repository.dart';
import 'package:appli_r/domain/repositories/preferences_repository.dart';
import 'package:appli_r/domain/repositories/public_transport_repository.dart';
import 'package:appli_r/domain/usecases/lines_from_favourite_networks.dart';
import 'package:appli_r/domain/usecases/nearest_bikes_usecase.dart';
import 'package:appli_r/domain/usecases/nearest_stops_usecase.dart';
import 'package:appli_r/domain/usecases/timetable_nearest_stops_usecase.dart';
import 'package:appli_r/presentation/viewmodels/bike_mode_viewmodel.dart';
import 'package:appli_r/presentation/viewmodels/car_mode_viewmodel.dart';
import 'package:appli_r/presentation/viewmodels/location_viewmodel.dart';
import 'package:appli_r/presentation/viewmodels/publicTransport/public_transport_map_viewmodel.dart';
import 'package:appli_r/presentation/viewmodels/public_transport_viewmodel.dart';
import 'package:appli_r/presentation/viewmodels/transport_mode_viewmodel.dart';
import 'package:appli_r/presentation/ui/navigation_bar.dart';
import 'package:appli_r/presentation/viewmodels/voi_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Obligatoire avant async
  Provider.debugCheckInvalidValueType = null;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final database = TestDatabase();
  final preferences = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        // Services
        Provider(create: (_) => VoiApi()),
        Provider(create: (_) => SharedPreferencesService(preferences)),
        Provider(create: (_) => PublicTransportApi()),
        Provider(create: (_) => LocationRepositoryImpl() as LocationRepository),



        // Repositories
        Provider(
          create: (context) =>
              BikesRepositoryImpl(context.read()) as BikesRepository,
        ),
                Provider(
          create: (context) =>
              PreferencesRepositoryImpl(context.read()) as PreferencesRepository),
        
        Provider(
          create: (context) =>
              PublicTransportRepositoryImpl(database, context.read())
                  as PublicTransportRepository,
        ),
                Provider(
          create: (context) =>
              WatchNearestVehiclesUseCase(context.read(), context.read()),
        ),
                        Provider(
          create: (context) =>
              WatchLinesFromFavouriteNetworks(context.read(), context.read()),
        ),
        Provider(
          create: (context) =>
              WatchNearestStopsUseCase(context.read(), context.read(), context.read()),
        ),
                Provider(
          create: (context) =>
              NearestArretsAllLinesRealtimeUseCase(context.read(), context.read()),
        ),
        Provider(
          create: (context) =>
              NearestArretsAllLinesRealtimeUseCase(context.read(), context.read()),
        ),



        // ViewModels
        ChangeNotifierProvider(
          create: (context) => LocationViewModel(context.read()),
        ),

        ChangeNotifierProvider(
          create: (context) => VoiViewModel(context.read(), context.read()),
        ),

                ChangeNotifierProvider(
          create: (context) => PublicTransportMapViewmodel(context.read(), context.read()),
        ),

        ChangeNotifierProvider(
          create: (context) => PublicTransportViewModel(context.read(), context.read(), context.read())
        ),

        ChangeNotifierProvider(create: (context) => BikeModeViewModel()),
        ChangeNotifierProvider(create: (context) => CarModeViewModel()),
        ChangeNotifierProvider(
          create: (context) => TransportModeViewModel(
            ptMode: context.read(),
            bikeMode: context.read(),
            carMode: context.read(),
          ),
        ),
      ],
      child: const AppliR(),
    ),
  );
}

class AppliR extends StatelessWidget {
  const AppliR({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: NavigationBarre());
  }
}
