import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:path_provider/path_provider.dart';

import 'core/di/injector.dart';
import 'core/logger/logger.dart';
import 'harman_app.dart';

Future<void> main() async {
  Log.init(usePrettyPrinter: true);
  await initializeDateFormatting('id', null);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  configureDependencies();
  runApp(
    HarmanApp(),
  );
}
