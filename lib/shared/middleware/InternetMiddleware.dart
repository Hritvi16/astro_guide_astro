import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetMiddleware extends GetMiddleware {
  final Connectivity _connectivity = Connectivity();

  @override
  int? get priority => 2;

  @override
  RouteSettings? redirect(String? route) {
    print("reditecr");
    // Check internet connectivity
    _connectivity.checkConnectivity().then((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        // Redirect to the no internet page
        return const RouteSettings(name: '/noInternet');
      }
      else {
        return null;
      }
    });

  }
}