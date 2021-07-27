part of 'recentmemes_bloc.dart';

abstract class RecentmemesState extends Equatable {
  const RecentmemesState();

  @override
  List<Object> get props => [];
}

class RecentmemesInitial extends RecentmemesState {}

class RecentMemesLaoding extends RecentmemesState {}

class RecentMemesListLoaded extends RecentmemesState {
  final List<Post> memesList;
  RecentMemesListLoaded({required this.memesList});
  @override
  List<Object> get props => [memesList];
}

class RecentMemesListLoadFailed extends RecentmemesState {
  final String message;
  RecentMemesListLoadFailed({required this.message});

  @override
  List<Object> get props => [message];
}
