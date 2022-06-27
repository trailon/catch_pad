part of 'activity_fetch_bloc.dart';

@immutable
abstract class ActivityFetchEvent extends Equatable {
  const ActivityFetchEvent();

  @override
  List<Object> get props => [];
}

class FetchActivity extends ActivityFetchEvent {
  FetchActivity(this.currentUrl);
  String currentUrl;
}
