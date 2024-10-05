import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:app_base_flutter/configs/storages/app_prefs.dart' as _i4;
import 'get_it.dart' as _i6;
import 'package:app_base_flutter/repositories/data_repository.dart' as _i5;

Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.factoryAsync<_i4.AppPrefStorage>(
    () => appModule.appPrefs,
    preResolve: true,
  );
  gh.lazySingleton<_i5.DataRepository>(() => _i5.DataRepository());
  return getIt;
}
class _$AppModule extends _i6.AppModule {}

// get_it: Được sử dụng để quản lý các đối tượng và dịch vụ cần thiết trong ứng dụng (_i1 là alias để dễ phân biệt).
// injectable: Thư viện dùng để tạo mã tự động cho dependency injection (_i2 là alias).
// app_prefs.dart: Module chứa AppPref, một lớp quản lý các thiết lập hoặc lưu trữ của ứng dụng (_i4 là alias).
// get_it.dart: Một file khác trong dự án có chứa cấu hình liên quan đến AppModule (_i6 là alias).
// data_repository.dart: Chứa lớp DataRepository, thường dùng để xử lý logic dữ liệu trong ứng dụng (_i5 là alias).