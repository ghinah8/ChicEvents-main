part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class SetProfileEvent extends ProfileEvent {
  final String? userName;
  final String? email;
  SetProfileEvent({
    this.userName,
    this.email,
  });
}
