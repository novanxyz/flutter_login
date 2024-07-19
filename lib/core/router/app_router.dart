import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:harman_app/blocs/auth/auth_cubit.dart';
import 'package:harman_app/blocs/get_calendar_event/get_calendar_event_bloc.dart';
import 'package:harman_app/screens/calendar/calendar_screen.dart';
import 'package:harman_app/screens/detail_event/detail_event_screen.dart';
import 'package:harman_app/screens/login/login_screen.dart';
import 'package:harman_app/screens/profile/profile_screen.dart';
import 'package:harman_app/screens/qr_screen/qr_sreen.dart';
import 'package:harman_app/screens/web_view_screen/web_view_screen.dart';
import 'app_routes.dart';

class AppRouter {
  final AuthCubit authCubit;

  AppRouter(this.authCubit);

  List<GoRoute> _registerRoutes() {
    return [
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.profileScreen,
        name: AppRoutes.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.calendarScreen,
        name: AppRoutes.calendarScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => GetCalendarEventBloc(),
          child: const CalendarScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.detailEventScreen,
        name: AppRoutes.detailEventScreen,
        builder: (context, state) {
          return DetailEventScreen(
            event: state.extra as Event,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.webViewScreen,
        name: AppRoutes.webViewScreen,
        builder: (context, state) {
          return WebViewScreen(
            url: state.extra as String,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.qrScreen,
        name: AppRoutes.qrScreen,
        builder: (context, state) {
          return const QrScreen();
        },
      ),
    ];
  }

  GoRouter get router => GoRouter(
        initialLocation: AppRoutes.loginScreen,
        routes: _registerRoutes(),
        redirect: (context, GoRouterState state) {
          final hasAuthentication =
              authCubit.state.authStatus == AuthStatus.authenticated &&
                  authCubit.state.user != null;

          final bool isExternalPages =
              state.matchedLocation == AppRoutes.loginScreen;
          if (hasAuthentication) {
            if (isExternalPages) {
              return AppRoutes.profileScreen;
            }
          } else {
            return isExternalPages ? null : AppRoutes.loginScreen;
          }
          return null;
        },
      );
}
