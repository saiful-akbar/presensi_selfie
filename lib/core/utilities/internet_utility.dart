import 'package:connectivity_plus/connectivity_plus.dart';

class InternetUtility {
  Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.isNotEmpty) {
      var result = connectivityResult.first;

      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        return true;
      }
    }

    return false;
  }
}
