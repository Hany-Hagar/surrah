import 'package:get_it/get_it.dart';
import '../services/hive_service.dart';
import '../../features/profile/data/repo/profile_repo.dart';
import '../../features/profile/data/database/profile_data.dart';
import '../../features/profile/data/repo/profile_repo_impl.dart';
import '../../features/profile/presentation/manager/profile_cubit.dart';
import '../../../features/settings/presentation/manager/settings_cubit.dart';

var getIt = GetIt.instance;

void setupLocator() {
  // Settings
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());

  // Hive Service
  getIt.registerLazySingleton<HiveService>(() => HiveService());

  // Profile
  getIt.registerLazySingleton<ProfileData>(
    () => ProfileData(hiveService: getIt<HiveService>()),
  );

  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(profileData: getIt<ProfileData>()),
  );

  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(profileRepo: getIt<ProfileRepo>()),
  );
}
