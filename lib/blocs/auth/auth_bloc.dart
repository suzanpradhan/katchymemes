import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:katchymemes/repository/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuthRepo _firebaseAuthRepo = FirebaseAuthRepo();
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is RegisterBeginEvent) {}
  }

  Stream<AuthState> registerUser({required String email, required String password}) async* {
    try {
      yield RegistrationLoading();
      UserCredential userCredential =
          await _firebaseAuthRepo.createAccountWithEmail(email, password);
      await _firebaseAuthRepo.signInAccountWithEmail(
          email: email, password: password);
      yield RegistrationSucessState();
    } catch (e) {
      yield RegistrationFailedState(message: e.toString());
    }
  }
}
