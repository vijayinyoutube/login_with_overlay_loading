import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:overlay_loading/Presentation/Screens/Dashboard/UI/dashboard.dart';
import 'package:overlay_loading/business_logic/bloc/Dashboard/dashboard_bloc.dart';

import '../../business_logic/bloc/LoginAuth/auth_bloc.dart';
import '../Screens/LoginPage/UI/login_page.dart';

class RouteGenerator {
  final AuthBloc _authBloc = AuthBloc();
  final DashboardBloc _dashboardBloc = DashboardBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AuthBloc>.value(
            value: _authBloc,
            child: const MyHomePage(title: "Login page with overlay"),
          ),
        );

      case '/dashboard':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<DashboardBloc>.value(
              value: _dashboardBloc,
              child: Dashboard(title: "Dashboard", username: args),
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR IN NAVIGATION'),
        ),
      );
    });
  }
}
