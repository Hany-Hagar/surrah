import 'package:hive/hive.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 0)
class ProfileModel extends HiveObject {
  @HiveField(0)
  final String firstName;

  @HiveField(1)
  final String lastName;

  @HiveField(2)
  final String? email;

  @HiveField(3)
  final String? photo;

  @HiveType(typeId: 4)
  final String currency;

   ProfileModel({
    required this.firstName,
    required this.lastName,
    this.email,
    this.photo,
    required this.currency,
  });

  factory ProfileModel.empty() {
    return  ProfileModel(
      email: null,
      photo: null,
      lastName: '',
      firstName: '',
      currency: 'EGP',
    );
  }

  ProfileModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? photo,
    String? currency,
  }) {
    return ProfileModel(
      email: email ?? this.email,
      photo: photo ?? this.photo,
      currency: currency ?? this.currency,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
    );
  }
}