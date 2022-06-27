import 'package:bloc/bloc.dart';
import 'package:catch_pad/constants/urls.dart';
import 'package:equatable/equatable.dart';

part 'url_cubit_state.dart';

class UrlCubit extends Cubit<String> {
  UrlCubit() : super(URL.activity);

  emitNewUrl(String newUrl) {
    emit(newUrl);
  }
}
