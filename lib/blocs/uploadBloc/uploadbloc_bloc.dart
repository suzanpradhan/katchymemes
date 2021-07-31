import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'uploadbloc_event.dart';
part 'uploadbloc_state.dart';

class UploadblocBloc extends Bloc<UploadblocEvent, UploadblocState> {
  UploadblocBloc() : super(UploadblocInitial());

  @override
  Stream<UploadblocState> mapEventToState(
    UploadblocEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
