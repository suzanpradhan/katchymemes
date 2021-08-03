part of 'userposts_bloc.dart';

abstract class UserpostsEvent extends Equatable {
  const UserpostsEvent();

  @override
  List<Object> get props => [];
}

class UserPostLoadBegin extends UserpostsEvent {
  final String userId;
  UserPostLoadBegin({required this.userId});
}

class UserPostLoaded extends UserpostsEvent {}
