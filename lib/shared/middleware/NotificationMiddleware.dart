import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // Check if notification permission is granted
    Permission.notification.isGranted.then((value) {
      if(value!=true) {
        return const RouteSettings(name: '/notificationPermission');
      }
    });

    return null;
  }
}
