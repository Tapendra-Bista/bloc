import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/inputvalidation/event.dart';
import 'package:test/inputvalidation/state.dart';

class InputBloc extends Bloc<InitialEvent, InputSate> {
  InputBloc() : super(InitialSate()) {
    on<InputEvent>((event, emit) => {
          if (event.username == '' || event.username!.length < 8)
            {emit(InvalideSate("Username must be contain 9 letter"))}
          else
            {
              emit(ValideSate()),
            }
        });

    on<OnclickEven>(
        (event, emit) => emit(OnbuttonClick("Username is Conform")));
  }
}
