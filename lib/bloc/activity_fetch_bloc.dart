// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:catch_pad/api/requests.dart';
import 'package:catch_pad/constants/texts.dart';
import 'package:catch_pad/models/activity_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'activity_fetch_event.dart';
part 'activity_fetch_state.dart';

class ActivityFetchBloc extends Bloc<ActivityFetchEvent, ActivityFetchState> {
  ActivityFetchBloc() : super(ActivityFetchInitial()) {
    on<FetchActivity>((event, emit) async {
      emit(ActivityFetchLoading());
      try {
        ActivityModel newActivity =
            await Requests.fetchActivty(event.currentUrl);
        emit(ActivityFetchLoaded(newActivity));
      } catch (e) {
        emit(ActivityFetchError(Strings.noNewActivity));
      }
    });
  }
}
