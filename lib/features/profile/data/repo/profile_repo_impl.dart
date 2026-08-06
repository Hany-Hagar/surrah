import 'profile_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/profile_model.dart';
import '../database/profile_data.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/errors/hive_failure.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileData profileData;

  ProfileRepoImpl({required this.profileData});

  @override
  Future<Either<Failure, ProfileModel?>> getProfile() async {
    try {
      final profile = profileData.get();
      return Right(profile);
    } catch (_) {
      return Left(HiveFailure.failedToReadData());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveProfile(ProfileModel profile) async {
    try {
      await profileData.save(profile);
      return const Right(unit);
    } catch (_) {
      return Left(HiveFailure.failedToWriteData());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProfile() async {
    try {
      await profileData.delete();
      return const Right(unit);
    } catch (_) {
      return Left(HiveFailure.failedToDeleteData());
    }
  }
}
