import 'package:connectivity/connectivity.dart';

mixin ConnectivityMixin {
  final connectivity = Connectivity();
  Future<bool> isInConnection() async {
    var connectivityResult = await connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
