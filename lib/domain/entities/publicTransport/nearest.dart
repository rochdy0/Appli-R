import 'package:appli_r/domain/entities/publicTransport/arret.dart';
import 'package:appli_r/domain/entities/publicTransport/ligne.dart';

class Nearest {
  Arret arret;
  Ligne ligne;

  Nearest(this.arret, this.ligne);

  @override
  String toString() {
    return "${arret.toString()} --- ${ligne.toString()}";
  }
}