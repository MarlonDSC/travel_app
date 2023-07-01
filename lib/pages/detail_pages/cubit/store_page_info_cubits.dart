import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:travel_app/pages/detail_pages/cubit/store_page_info_states.dart';

class StorePageInfoCubits extends Cubit<List<StorePageInfoState>> {
  StorePageInfoCubits() : super([]);

  addPageInfo(String? name, int? index, Color? color) {
    emit(
        [StorePageInfoState(name: name, index: index, color: color), ...state]);
  }

  updatePageInfo(String? name, int? index, Color? color) {
    var myList = state;
    for (int i = 0; i < myList.length; i++) {
      if (myList[i].name == name) {}
    }

    emit(
        [StorePageInfoState(name: name, index: index, color: color), ...state]);
  }

  updatePageWish(String? name, int? index, Color? color) {
    var myList = state;
    for (int i = 0; i < myList.length; i++) {
      if (myList[i].name == name) {
        state.removeAt(i);
      }
    }
    emit(
        [StorePageInfoState(name: name, index: index, color: color), ...state]);
  }
}
