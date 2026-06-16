import 'package:get_it/get_it.dart';
import 'package:get_it_injector/get_it_injector.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@setup
void configureDependencies() {
  getIt.init();
}
