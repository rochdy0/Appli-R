import 'package:appli_r/domain/entities/voi_vehicule.dart';

abstract class BikesRepository {
  Future<Set<VoiVehicule>> getVoiVehicules();
  Stream<Set<VoiVehicule>> watchVoiVehicules({Duration period});
  void dispose();
}
