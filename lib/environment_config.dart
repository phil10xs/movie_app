import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnvironmentConfig {
  // We add the api key by running 'flutter run --dart-define=movieApiKey=MYKEY
  final movieApiKey =
      const String.fromEnvironment("2daecc0e498e4662c01e640c0d9f90d0");
}

final environmentConfigProvider = Provider<EnvironmentConfig>((ref) {
  return EnvironmentConfig();
});
