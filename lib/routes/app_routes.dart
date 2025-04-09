import 'package:get/get.dart';
import 'package:vastraa/Constants/route_constant.dart';
import 'package:vastraa/first.dart';
import 'package:vastraa/second_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: RouteConstant.splashScreen, page: () => First(),),
    GetPage(name: RouteConstant.secondScreen, page: () => Second(),),
  ];
}
