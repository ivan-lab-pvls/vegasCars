import 'package:auto_route/auto_route.dart';
import 'package:car_rent_app/screens/news/news_info/news_info_screen.dart';
import 'package:car_rent_app/screens/news/news_list/news_list_screen.dart';
import 'package:car_rent_app/screens/onboarding/onboarding_screen.dart';
import 'package:car_rent_app/screens/settings/settings_screen.dart';
import 'package:car_rent_app/screens/transpot/add_transport/add_transport_screen.dart';
import 'package:car_rent_app/screens/transpot/edit_transport/edit_transport_screen.dart';
import 'package:car_rent_app/screens/transpot/transport_info/transport_info_screen.dart';
import 'package:car_rent_app/screens/transpot/transpot_list/transpot_list_screen.dart';
import 'package:car_rent_app/models/news_model.dart';
import 'package:car_rent_app/models/transport_model.dart';

import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: TransportListRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: NewsListRoute.page),
    AutoRoute(page: NewsInfoRoute.page),
    AutoRoute(page: AddTransportRoute.page),
    AutoRoute(page: TransportInfoRoute.page),
    AutoRoute(page: EditTransportRoute.page),

  ];
}