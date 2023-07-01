import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  final List<DataModel> places = [];

  void getData() async {
    try {
      emit(LoadingState());
      places.addAll(List.from(await data.getInfo()));
      emit(LoadedState(places));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
