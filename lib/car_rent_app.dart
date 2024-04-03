import 'package:car_rent_app/router/router.dart';
import 'package:flutter/material.dart';

class CarRentApp extends StatelessWidget {
  CarRentApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'SF Pro Display'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
