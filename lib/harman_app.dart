import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth/auth_cubit.dart';
import 'core/di/injector.dart';
import 'core/router/app_router.dart';

class HarmanApp extends StatelessWidget {
  HarmanApp({super.key});
  final AuthCubit authCubit = getIt<AuthCubit>();
  late final GoRouter _router = AppRouter(authCubit).router;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>authCubit,
      child: GlobalLoaderOverlay(
        child: LoaderOverlay(
          child: MaterialApp.router(
            routeInformationParser: _router.routeInformationParser,
            routeInformationProvider: _router.routeInformationProvider,
            routerDelegate: _router.routerDelegate,
            themeMode: ThemeMode.light,
            theme: ThemeData(
                brightness: Brightness.light,
                useMaterial3: true,
                scaffoldBackgroundColor: const Color.fromRGBO(43,58,81,1)
            ),
          ),
        ),
      ),
    );
  }
}
