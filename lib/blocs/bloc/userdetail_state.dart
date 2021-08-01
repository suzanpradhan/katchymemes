part of 'userdetail_bloc.dart';

abstract class UserdetailState extends Equatable {
  const UserdetailState();

  @override
  List<Object> get props => [];
}

class UserdetailInitial extends UserdetailState {}

class UserDetailLoading extends UserdetailState {}

class UserDetailLoadSucces extends UserdetailState {
  final UserModel data;
  UserDetailLoadSucces({required this.data});
  @override
  List<Object> get props => [data];
}

class UserDetailLoadFailed extends UserdetailState {
  final String message;
  UserDetailLoadFailed({required this.message});

  @override
  List<Object> get props => [message];
}
