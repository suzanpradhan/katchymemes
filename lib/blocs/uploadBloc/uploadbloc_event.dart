part of 'uploadbloc_bloc.dart';

abstract class UploadblocEvent extends Equatable {
  const UploadblocEvent();

  @override
  List<Object> get props => [];
}

class RequestPostUpload extends UploadblocEvent {
  final String? username;
  final String? description;
  final File image;

  RequestPostUpload({this.username, this.description, required this.image});
}

class PostSubmitted extends UploadblocEvent {}