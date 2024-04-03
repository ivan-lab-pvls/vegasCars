// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddTransportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddTransportScreen(),
      );
    },
    EditTransportRoute.name: (routeData) {
      final args = routeData.argsAs<EditTransportRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditTransportScreen(
          key: args.key,
          transport: args.transport,
        ),
      );
    },
    NewsInfoRoute.name: (routeData) {
      final args = routeData.argsAs<NewsInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsInfoScreen(
          key: args.key,
          news: args.news,
        ),
      );
    },
    NewsListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewsListScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
    TransportInfoRoute.name: (routeData) {
      final args = routeData.argsAs<TransportInfoRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TransportInfoScreen(
          key: args.key,
          transport: args.transport,
        ),
      );
    },
    TransportListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransportListScreen(),
      );
    },
  };
}

/// generated route for
/// [AddTransportScreen]
class AddTransportRoute extends PageRouteInfo<void> {
  const AddTransportRoute({List<PageRouteInfo>? children})
      : super(
          AddTransportRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTransportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditTransportScreen]
class EditTransportRoute extends PageRouteInfo<EditTransportRouteArgs> {
  EditTransportRoute({
    Key? key,
    required TransportModel transport,
    List<PageRouteInfo>? children,
  }) : super(
          EditTransportRoute.name,
          args: EditTransportRouteArgs(
            key: key,
            transport: transport,
          ),
          initialChildren: children,
        );

  static const String name = 'EditTransportRoute';

  static const PageInfo<EditTransportRouteArgs> page =
      PageInfo<EditTransportRouteArgs>(name);
}

class EditTransportRouteArgs {
  const EditTransportRouteArgs({
    this.key,
    required this.transport,
  });

  final Key? key;

  final TransportModel transport;

  @override
  String toString() {
    return 'EditTransportRouteArgs{key: $key, transport: $transport}';
  }
}

/// generated route for
/// [NewsInfoScreen]
class NewsInfoRoute extends PageRouteInfo<NewsInfoRouteArgs> {
  NewsInfoRoute({
    Key? key,
    required NewsModel news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsInfoRoute.name,
          args: NewsInfoRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsInfoRoute';

  static const PageInfo<NewsInfoRouteArgs> page =
      PageInfo<NewsInfoRouteArgs>(name);
}

class NewsInfoRouteArgs {
  const NewsInfoRouteArgs({
    this.key,
    required this.news,
  });

  final Key? key;

  final NewsModel news;

  @override
  String toString() {
    return 'NewsInfoRouteArgs{key: $key, news: $news}';
  }
}

/// generated route for
/// [NewsListScreen]
class NewsListRoute extends PageRouteInfo<void> {
  const NewsListRoute({List<PageRouteInfo>? children})
      : super(
          NewsListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransportInfoScreen]
class TransportInfoRoute extends PageRouteInfo<TransportInfoRouteArgs> {
  TransportInfoRoute({
    Key? key,
    required TransportModel transport,
    List<PageRouteInfo>? children,
  }) : super(
          TransportInfoRoute.name,
          args: TransportInfoRouteArgs(
            key: key,
            transport: transport,
          ),
          initialChildren: children,
        );

  static const String name = 'TransportInfoRoute';

  static const PageInfo<TransportInfoRouteArgs> page =
      PageInfo<TransportInfoRouteArgs>(name);
}

class TransportInfoRouteArgs {
  const TransportInfoRouteArgs({
    this.key,
    required this.transport,
  });

  final Key? key;

  final TransportModel transport;

  @override
  String toString() {
    return 'TransportInfoRouteArgs{key: $key, transport: $transport}';
  }
}

/// generated route for
/// [TransportListScreen]
class TransportListRoute extends PageRouteInfo<void> {
  const TransportListRoute({List<PageRouteInfo>? children})
      : super(
          TransportListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransportListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
