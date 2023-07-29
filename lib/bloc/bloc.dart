import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:test/bloc/even.dart';
import 'package:test/bloc/state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectitvity;
  InternetBloc() : super(InternetInitial()) {
    on<InternetGainEvent>((event, emit) => emit(InternetGainState()));
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));

   connectitvity = _connectivity.onConnectivityChanged.listen((result) {
      if (
       result == ConnectivityResult.wifi) {
        add(InternetGainEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close(){
connectitvity?.cancel();
return super.close();
  }
}
