part of 'activity_fetch_bloc.dart';

@immutable
abstract class ActivityFetchState extends Equatable {
  const ActivityFetchState();

  @override
  List<Object> get props => [];
}

class ActivityFetchInitial extends ActivityFetchState {}

class ActivityFetchLoading extends ActivityFetchState {}

class ActivityFetchLoaded extends ActivityFetchState {
  final ActivityModel activityModel;
  const ActivityFetchLoaded(this.activityModel);
}

class ActivityFetchError extends ActivityFetchState {
  final String? message;
  const ActivityFetchError(this.message);
}
