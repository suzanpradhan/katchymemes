import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:katchymemes/models/user_model.dart';
import 'package:katchymemes/repository/user_repository.dart';

part 'userdetail_event.dart';
part 'userdetail_state.dart';

class UserdetailBloc extends Bloc<UserdetailEvent, UserdetailState> {
  UserdetailBloc() : super(UserdetailInitial());

  @override
  Stream<UserdetailState> mapEventToState(
    UserdetailEvent event,
  ) async* {
    if (event is UserDetailLoadBegin) {
      yield* loadUserData(event.userId);
    }
  }

  Stream<UserdetailState> loadUserData(String? userId) async* {
    try {
      yield UserDetailLoading();
      UserRepository _userRepository = new UserRepository();
      UserModel userData = await _userRepository.getUserDetails(userId);
      yield UserDetailLoadSucces(data: userData);
    } catch (e) {
      yield UserDetailLoadFailed(message: e.toString());
    }
  }
}
