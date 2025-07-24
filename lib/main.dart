import 'package:appli_r/models/database.dart';
import 'package:appli_r/services/location_service.dart';
import 'package:appli_r/viewmodels/bike_mode_view_model.dart';
import 'package:appli_r/viewmodels/car_mode_view_model.dart';
import 'package:appli_r/viewmodels/public_transport_view_model.dart';
import 'package:appli_r/viewmodels/transport_mode_view_model.dart';
import 'package:appli_r/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Obligatoire avant async
  Provider.debugCheckInvalidValueType = null;
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final database = AppDatabase();
  final locationService = LocationService();

  final carModeVM = CarModeViewModel();
  final bikeModeVM = BikeModeViewModel();
  final ptModeVM = PublicTransportViewModel(database, locationService);
  ptModeVM.init();

  final transportVM = TransportModeViewModel(
    carMode: carModeVM,
    bikeMode: bikeModeVM,
    ptMode: ptModeVM,
  );

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => locationService),
      ChangeNotifierProvider(create: (_) => transportVM),
      ChangeNotifierProvider.value(value: carModeVM),
      ChangeNotifierProvider.value(value: bikeModeVM),
      ChangeNotifierProvider.value(value: ptModeVM)],
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
