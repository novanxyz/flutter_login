
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';


final getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$init',
  asExtension: false,
  preferRelativeImports: true,
)
void configureDependencies() {
  $init(getIt);
}
