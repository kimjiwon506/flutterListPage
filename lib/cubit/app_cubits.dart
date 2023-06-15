import 'package:bloc/bloc.dart';
import 'package:flutter_application_0612/cubit/app_cubit_states.dart';
import 'package:flutter_application_0612/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState());
    } catch (e) {}
  }
}
