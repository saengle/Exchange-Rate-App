import 'package:exchange_rate/ui/exchange_rate_screen.dart';
import 'package:exchange_rate/ui/national_check_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

abstract class Routes {
  static const String mainRoute = '/Main';
  static const String nationalCheckRoute = '/NationalCheck';
}

final GoRouter router = GoRouter(
  initialLocation: Routes.mainRoute,
  routes: <GoRoute>[
    GoRoute(
      path: Routes.mainRoute,
      builder: (BuildContext context, GoRouterState state) {
        return ExchangeRateScreen();
      },
    ),
    // GoRoute(
    //   path: Routes.nationalCheckRoute,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return ChangeNotifierProvider(
    //       create: (_) => MemoWriteViewModel(),
    //       child: const NationalCheckScreen(),
    //     );
    //   },
    // ),
  ],
);
