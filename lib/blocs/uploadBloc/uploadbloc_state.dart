part of 'uploadbloc_bloc.dart';

abstract class UploadblocState extends Equatable {
  const UploadblocState();

  @override
  List<Object?> get props => [];
}

class UploadblocInitial extends UploadblocState {}

class UploadLoading extends UploadblocState {}

class UploadSuccess extends UploadblocState {}

class UploadFailed extends UploadblocState {
  final String? message;

  UploadFailed({this.message});
  @override
  List<Object?> get props => [message];
}
