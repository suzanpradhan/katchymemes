part of 'uploadbloc_bloc.dart';

abstract class UploadblocEvent extends Equatable {
  const UploadblocEvent();

  @override
  List<Object> get props => [];
}

class RequestPostUpload extends UploadblocEvent {}
