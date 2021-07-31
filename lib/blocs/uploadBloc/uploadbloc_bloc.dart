import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:katchymemes/repository/post_repository.dart';

part 'uploadbloc_event.dart';
part 'uploadbloc_state.dart';

class UploadblocBloc extends Bloc<UploadblocEvent, UploadblocState> {
  UploadblocBloc() : super(UploadblocInitial());

  @override
  Stream<UploadblocState> mapEventToState(
    UploadblocEvent event,
  ) async* {
    if (event is RequestPostUpload) {
      yield* uploadPost(
          username: event.username!,
          description: event.description!,
          image: event.image);
    }
  }

  Stream<UploadblocState> uploadPost(
      {required String username,
      required String description,
      required File image}) async* {
    try {
      yield UploadLoading();
      PostRepository _postRepository = new PostRepository();
      bool status = await _postRepository.addPost(
          image: image, username: username, description: description);
      if (status) {
        yield UploadSuccess();
      } else {
        yield UploadFailed(message: "Error Occurred");
      }
    } catch (e) {
      yield UploadFailed(message: e.toString());
    }
  }
}
