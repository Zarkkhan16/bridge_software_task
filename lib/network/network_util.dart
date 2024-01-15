import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtil {
  static Future<bool> isConnected() async {
    final status = await Connectivity().checkConnectivity();
    return status == ConnectivityResult.wifi || status == ConnectivityResult.mobile;
  }
}
