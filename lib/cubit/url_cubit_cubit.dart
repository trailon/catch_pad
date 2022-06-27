// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:catch_pad/constants/urls.dart';
import 'package:equatable/equatable.dart';

class UrlCubit extends Cubit<String> {
  UrlCubit() : super(URL.activity);

  emitNewUrl(String newUrl) {
    emit(newUrl);
  }
}
