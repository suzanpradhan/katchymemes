part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterBeginEvent extends AuthEvent {
  final String? email;
  final String? password;

  RegisterBeginEvent({this.email, this.password});
}
