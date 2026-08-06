import 'package:dartz/dartz.dart';
import '../models/profile_model.dart';
import '../../../../core/errors/failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, ProfileModel?>> getProfile();

  Future<Either<Failure, void>> saveProfile(ProfileModel profile);

  Future<Either<Failure, void>> deleteProfile();
}
