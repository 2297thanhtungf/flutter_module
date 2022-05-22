import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavors { prod, beta, stg }

class FlavorConfig {
  static final _flavorConfig = FlavorConfig();

  static FlavorConfig get instance => _flavorConfig;

  Flavors? flavor;

  Future<void> init(Flavors flavor) async {
    _flavorConfig.flavor ??= flavor;
    await dotenv.load(fileName: "env/${getFlavor()}/env");
  }

  String getFlavor() {
    return flavor.toString().split('.').last.toLowerCase();
  }

  String getBaseUrl() {
    return dotenv.get('URL');
  }

  String getTestToken() {
    return dotenv.get('TOKEN');
  }

  static bool isProduction() => instance.flavor == Flavors.prod;

  static bool isBeta() => instance.flavor == Flavors.beta;

  static bool isSTG() => instance.flavor == Flavors.stg;
}
