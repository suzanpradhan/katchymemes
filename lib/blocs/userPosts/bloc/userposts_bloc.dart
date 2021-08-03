import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:katchymemes/models/posts_model.dart';
import 'package:katchymemes/repository/user_repository.dart';

part 'userposts_event.dart';
part 'userposts_state.dart';

class UserpostsBloc extends Bloc<UserpostsEvent, UserpostsState> {
  UserpostsBloc() : super(UserpostsInitial());
  UserRepository _userRepository = UserRepository();
  @override
  Stream<UserpostsState> mapEventToState(
    UserpostsEvent event,
  ) async* {
    if (event is UserPostLoadBegin) {
      yield* getUserPosts(event.userId);
    }
  }

  Stream<UserpostsState> getUserPosts(String userId) async* {
    try {
      yield UserPostsLoading();
      List<Post> userPosts = await _userRepository.getUserPosts(userId);
      yield UserPostsLoadSuccess(userMemesList: userPosts);
    } catch (e) {
      yield UserPostsLoadFailed(message: e.toString());
    }
  }
}
