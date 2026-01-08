/* import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import 'package:appli_r/data/datasources/local/preferences/shared_preferences_reseaux.dart';
import 'package:appli_r/domain/entities/publicTransport/reseau.dart';
import 'package:appli_r/data/repositories/preferences_repository.dart';

class MockPreferencesService extends Mock implements SharedPreferencesService {}

void main() {
  late MockPreferencesService mockService;
  late PreferencesRepositoryImpl repo;

  setUp(() {
    mockService = MockPreferencesService();
    when(() => mockService.get(PrefType.selectedReseau)).thenReturn(<String>{});
    when(() => mockService.get(PrefType.favouriteStop)).thenReturn(<String>{});

    repo = PreferencesRepositoryImpl(mockService);
  });

  tearDown(() {
    repo.dispose();
  });

  test('add reseau met à jour le BehaviorSubject et retourne Success', () async {
    // Arrange
    when(() => mockService.add(PrefType.selectedReseau, 'TAG'))
        .thenAnswer((_) async => Success(<String>{'TAG'}));

    // Act
    final result = await repo.addNetworkPreferences('TAG');

    // Assert
    expect(result.isSuccess(), true);
    expect(result.getOrNull()!.map((r) => r.id), {'TAG'});

    // Vérifier que le stream émet aussi la valeur
    expectLater(
      repo.watchNetworkPreferences(),
      emits(predicate<Set<Reseau>>((set) => set.any((r) => r.id == 'TAG'))),
    );
  });

  test('remove reseau met à jour le BehaviorSubject et retourne Success', () async {
    when(() => mockService.remove(PrefType.selectedReseau, 'TAG'))
        .thenAnswer((_) async => Success(<String>{}));

    final result = await repo.removeNetworkPreferences('TAG');

    expect(result.isSuccess(), true);
    expect(result.getOrNull(), isEmpty);
  });

/*   test('si le service retourne une erreur, alors Failure est propagé', () async {
    when(() => mockService.add(PrefType.selectedReseau, 'FAIL'))
        .thenAnswer((_) async => Failure('erreur'));

    final result = await repo.addNetworkPreferences('FAIL');

    expect(result.isFailure(), true);
    expect(result.exceptionOrNull(), 'erreur');
  }); */
}
 */