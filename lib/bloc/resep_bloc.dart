import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_shared/model/resep_model.dart';
import 'package:state_shared/services/resep_service.dart';

class ResepEvent {}

class ResepEventFetch extends ResepEvent {}

class ResepState {
  Resep? resep;

  ResepState({this.resep});
}

class LoadingResepState extends ResepState {}

class ErrorResepState extends ResepState {}

class ResepBloc extends Bloc<ResepEvent, ResepState> {
  ResepBloc() : super(LoadingResepState()) {
    on<ResepEventFetch>((event, emit) async {
      try {
        emit(LoadingResepState());
        Resep? resep = await ResepService().getAllResep();
        emit(ResepState(resep: resep));
      } catch (e) {
        emit(ErrorResepState());
      }
    });
  }
}
