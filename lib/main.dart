import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:vastraa/Constants/route_constant.dart';
import 'package:vastraa/Controller/InitialBindings.dart';
import 'package:vastraa/first.dart';
import 'package:vastraa/routes/app_routes.dart';

void main() {
  WidgetsBinding widgetsFlutterBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);

  runApp(const MyApp());

  WidgetsBinding.instance.addPostFrameCallback((_) {
    FlutterNativeSplash.remove();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      initialBinding: Initialbindings(),
      getPages: AppRoutes.routes,
      initialRoute: RouteConstant.splashScreen,
    );
  }
}
