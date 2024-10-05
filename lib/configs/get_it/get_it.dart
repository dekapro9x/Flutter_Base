import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:app_base_flutter/configs/storages/app_prefs.dart';
import 'package:app_base_flutter/configs/get_it/get_it.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() => $initGetIt(getIt);

@module
abstract class AppModule {
  @preResolve
  Future<AppPrefStorage> get appPrefs => AppPrefStorage.instance();
}

// flutter pub run build_runner build
// Nếu muốn theo dõi các thay đổi và tự động sinh mã khi có thay đổi, bạn có thể sử dụng lệnh:
// flutter pub run build_runner watch