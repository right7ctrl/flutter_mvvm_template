
import 'package:get_it/get_it.dart';
import 'package:pttem_flutter_template/ui/feature/sample/repository/sample_repository.dart';
import 'package:pttem_flutter_template/ui/feature/splash/splash_viewmodel.dart';
import '../../service/dynamic_link_service.dart';
import '../../ui/feature/sample/sample_viewmodel.dart';
import 'navigation/navigation_service.dart';
import 'network/logger/exception_logger.dart';
import '../init/theme/app_theme_provider.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DynamicLinkService());
  locator.registerLazySingleton(() => AppThemeProvider());
  locator.registerLazySingleton(() => ExceptionLogger());
  locator.registerLazySingleton(() => SampleRepository());
  locator.registerLazySingleton(() => SampleViewModel());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SplashViewModel());

}