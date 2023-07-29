// enum for short data
// cubic take function and gives state
// where bloc take event and gives sates
// Note event necessary here

// An enum type is a special data type that enables for a variable to be a set of predefined constants
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { initial, lost, gain }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;
  InternetCubit() : super(InternetState.initial) {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
// bloc ma add
// cubit ma emit
        emit(InternetState.gain);
      } else {
        emit(InternetState.lost);
      }
    });
  }

  Future<void> closed() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
