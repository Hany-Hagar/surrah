sealed class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

// Get Profile States
class GetProfileLoading extends ProfileStates {}

class GetProfileSuccess extends ProfileStates {}

class GetProfileFailure extends ProfileStates {
  final String message;

  GetProfileFailure({required this.message});
}

// Save Profile States
class SaveProfileLoading extends ProfileStates {}

class SaveProfileSuccess extends ProfileStates {}

class SaveProfileFailure extends ProfileStates {
  final String message;

  SaveProfileFailure({required this.message});
}

// Delete Profile States
class DeleteProfileLoading extends ProfileStates {}

class DeleteProfileSuccess extends ProfileStates {}

class DeleteProfileFailure extends ProfileStates {
  final String message;

  DeleteProfileFailure({required this.message});
}
