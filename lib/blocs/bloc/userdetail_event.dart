part of 'userdetail_bloc.dart';

abstract class UserdetailEvent extends Equatable {
  const UserdetailEvent();

  @override
  List<Object> get props => [];
}

class UserDetailLoadBegin extends UserdetailEvent {
  final String? userId;
  const UserDetailLoadBegin(this.userId);
}

class UserDetailLoaded extends UserdetailEvent {}
