import '../models/profile_model.dart';
import '../../../../const/hive_data.dart';
import '../../../../core/services/hive_service.dart';

class ProfileData {
  final HiveService hiveService;

  const ProfileData({required this.hiveService});

  static const boxName = HiveData.profileBox;

  Future<void> init() async {
    await hiveService.openBox<ProfileModel>(boxName);
  }

  Future<void> save(ProfileModel profile) async {
    await hiveService.put(boxName: boxName, key: 'user', value: profile);
  }

  ProfileModel? get() {
    return hiveService.get<ProfileModel>(boxName: boxName, key: 'user');
  }

  Future<void> delete() async {
    await hiveService.delete(boxName: boxName, key: 'user');
  }
}
