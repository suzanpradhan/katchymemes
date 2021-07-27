part of 'recentmemes_bloc.dart';

abstract class RecentmemesEvent extends Equatable {
  const RecentmemesEvent();

  @override
  List<Object> get props => [];
}

class RequestRecentMemes extends RecentmemesEvent {}
