import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:katchymemes/models/posts_model.dart';
import 'package:katchymemes/repository/post_repository.dart';

part 'recentmemes_event.dart';
part 'recentmemes_state.dart';

class RecentmemesBloc extends Bloc<RecentmemesEvent, RecentmemesState> {
  PostRepository _postRepository = PostRepository();
  RecentmemesBloc() : super(RecentmemesInitial());

  @override
  Stream<RecentmemesState> mapEventToState(
    RecentmemesEvent event,
  ) async* {
    if (event is RecentmemesEvent) {
      yield* recentMemesListMapEventToState();
    }
  }

  Stream<RecentmemesState> recentMemesListMapEventToState() async* {
    try {
      yield RecentMemesLaoding();
      List<Post> listOfMemes = await _postRepository.fetchPosts();
      yield RecentMemesListLoaded(memesList: listOfMemes);
    } catch (e) {
      yield RecentMemesListLoadFailed(message: e.toString());
    }
  }
}
