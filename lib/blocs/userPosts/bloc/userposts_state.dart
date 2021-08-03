part of 'userposts_bloc.dart';

abstract class UserpostsState extends Equatable {
  const UserpostsState();

  @override
  List<Object> get props => [];
}

class UserpostsInitial extends UserpostsState {}

class UserPostsLoading extends UserpostsState {}

class UserPostsLoadSuccess extends UserpostsState {
  final List<Post> userMemesList;
  UserPostsLoadSuccess({required this.userMemesList});
  @override
  List<Object> get props => [userMemesList];
}

class UserPostsLoadFailed extends UserpostsState {
  final String message;
  UserPostsLoadFailed({required this.message});
  @override
  List<Object> get props => [message];
}
