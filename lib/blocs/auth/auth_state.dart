part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class RegistrationLoading extends AuthState {}

class RegistrationSucessState extends AuthState {}

class RegistrationFailedState extends AuthState {
  final String? message;

  RegistrationFailedState({this.message});
  @override
  List<Object?> get props => [message];
}
